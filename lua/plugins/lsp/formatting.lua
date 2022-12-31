local util = require("util")

local M = {
  autoformat = true,
}

function M.toggle()
  M.autoformat = not M.autoformat
  if M.autoformat then
    util.info("enabled format on save", "Formatting")
  else
    util.warn("disabled format on save", "Formatting")
  end
end

function M.format()
  if M.autoformat then
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    else
      vim.lsp.buf.formatting_sync({}, 1000)
    end
  end
end

function M.setup(client, buf)
  local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
  local null_ls = require("plugins.null-ls")

  -- Use null-ls if it has a formatter
  local enable = false
  if null_ls.has_formatter(filetype) then
    enable = client.name == "null-ls"
  else
    enable = not (client.name == "null-ls")
  end

  if client.name == "tsserver" then
    enable = false
  end

  util.info(client.name .. " " .. (enable and "yes" or "no"), "format")

  client.server_capabilities.documentFormattingProvider = enable

  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd([[
      augroup LspFormat
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua require("plugins.lsp.formatting").format()
      augroup END
    ]])
  end
end

return M
