local M = {}

--- @param str string
function M.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Log to nvim messages
--- @param msg string
--- @param hl string
--- @param name string
function M.log(msg, hl, name)
  name = name or "Neovim"
  vim.api.nvim_echo({ { name .. ": ", hl }, { msg } }, true, {})
end

--- @param msg string
--- @param name string
function M.warn(msg, name)
  M.log(msg, "LspDiagnosticsDefaultWarning", name)
end

--- @param msg string
--- @param name string
function M.error(msg, name)
  M.log(msg, "LspDiagnosticsDefaultError", name)
end

--- @param msg string
--- @param name string
function M.info(msg, name)
  M.log(msg, "LspDiagnosticsDefaultInformation", name)
end

-- Get keys from table
--- @param table table<string, any>
--- @return string[]
function M.get_keys(table)
  --- @type string[]
  local keyset = {}
  local n = 0

  for key, _ in pairs(table) do
    n = n + 1
    keyset[n] = key
  end

  return keyset
end

return M
