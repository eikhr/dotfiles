local utils = require("util")

local M = {
  "williamboman/mason.nvim",
  cmd = "Mason",
}

local tools = {
  -- lua
  "stylua",
  "selene",
  "luacheck",
  -- js / ts
  "prettierd",
  "eslint_d",
  "deno",
  -- shell
  "shellcheck",
  "shfmt",
  -- python
  "black",
  "isort",
  "flake8",
}

local language_servers = utils.get_keys(require("config.plugins.lsp").language_servers)

local function ensure_installed()
  local registry = require("mason-registry")
  for _, tool in ipairs(tools) do
    local package = registry.get_package(tool)
    if not package:is_installed() then
      package:install()
    end
  end
end

function M.config()
  require("mason").setup()
  ensure_installed()
  require("mason-lspconfig").setup({
    ensure_installed = language_servers,
    automatic_installation = true,
  })
end

return M
