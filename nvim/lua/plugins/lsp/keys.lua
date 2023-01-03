local wk = require("which-key")

local M = {}

function M.setup(client, buffer)
  wk.register({
    buffer = buffer,
    K = { vim.lsp.buf.hover, "Hover Documentation" },
    ["<leader>"] = {
      c = {
        name = "+code",
        {
          cond = client.name == "tsserver",
          R = { ":TypescriptRenameFile<CR>", "Rename File" },
        },
        a = {
          { vim.lsp.buf.code_action, "Code Action" },
          { vim.lsp.buf.code_action, "Code Action", mode = "v" },
        },
        d = { vim.diagnostic.open_float, "Line Diagnostics" },
      },
    },
    g = {
      name = "+goto",
      d = { "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
      r = { "<cmd>Telescope lsp_references<cr>", "References" },
      R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
      D = { "<cmd>Telescope lsp_declarations<CR>", "Goto Declaration" },
      I = { "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
      t = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
    },
  })
end

return M
