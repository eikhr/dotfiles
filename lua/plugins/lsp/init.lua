local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    { "folke/neodev.nvim", config = true },
  },
}

---@type lspconfig.options
M.language_servers = {
  ansiblels = {},
  arduino_language_server = {},
  astro = {},
  bashls = {},
  clangd = {},
  cssls = {},
  cssmodules_ls = {},
  clojure_lsp = {},
  denols = {},
  dockerls = {},
  elmls = {},
  gopls = {},
  graphql = {},
  html = {},
  jsonls = {},
  pyright = {},
  tsserver = {},
  sumneko_lua = {
    single_file_support = true,
    settings = {
      Lua = {
        completion = {
          workspaceWord = true,
          displayContext = 5,
        },
        diagnostics = {
          groupSeverity = {
            strong = "Warning",
            strict = "Warning",
          },
          unusedLocalExclude = { "_*" },
        },
        format = {
          enable = false, -- Format with stylua
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
            continuation_indent_size = "2",
          },
        },
        workspace = {
          checkThirdParty = false,
        },
      },
    },
  },
  marksman = {},
  rust_analyzer = {},
  svelte = {},
  tailwindcss = {},
  vimls = {},
  yamlls = {},
}

function M.config()
  require("mason")
  require("plugins.lsp.diagnostics").setup()

  local function on_attach(client, bufnr)
    if not (client.name == "null-ls") then
      require("nvim-navic").attach(client, bufnr)
    end
    require("plugins.lsp.formatting").setup(client, bufnr)
    require("plugins.lsp.keys").setup(client, bufnr)
  end

  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  ---@type _.lspconfig.options
  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }

  for server, opts in pairs(M.language_servers) do
    opts = vim.tbl_deep_extend("force", {}, options, opts or {})
    if server == "tsserver" then
      require("typescript").setup({ server = opts })
    else
      require("lspconfig")[server].setup(opts)
    end
  end

  require("plugins.null-ls").setup(options)
end

return M
