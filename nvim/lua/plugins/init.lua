return {
  { "sheerun/vim-polyglot", event = "VeryLazy" },
  { "jose-elias-alvarez/typescript.nvim" },
  { "tpope/vim-sleuth", event = "VeryLazy", dependencies = { "sheerun/vim-polyglot" } },
  { "williamboman/mason-lspconfig.nvim" }, -- config in ./mason.lua
  { "b0o/SchemaStore.nvim" },
}
