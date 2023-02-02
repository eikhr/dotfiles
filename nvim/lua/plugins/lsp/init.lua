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
  -- denols = {},
  dockerls = {},
  elmls = {},
  eslint = {
    flags = { debounce_text_changes = 500 },
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
      local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.format({ async = true })
        end,
        group = au_lsp,
      })
    end,
  },
  gopls = {},
  graphql = {},
  html = {},
  jsonls = {
    on_new_config = function(new_config)
      new_config.settings.json.schemas = new_config.settings.json.schemas or {}
      vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
    end,
    settings = {
      json = {
        format = {
          enable = true,
        },
        validate = { enable = true },
      },
    },
  },
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
  -- tailwindcss = {},
  vimls = {},
  yamlls = {},
}

local nvim_navic_exclude = {
  ["null-ls"] = true,
  ["eslint"] = true,
  ["cssmodules_ls"] = true,
}

function M.config()
  require("mason")
  require("plugins.lsp.diagnostics").setup()

  local function on_attach(client, bufnr)
    if not nvim_navic_exclude[client.name] then
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
