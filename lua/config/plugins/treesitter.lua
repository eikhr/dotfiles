local M = {
  "nvim-treesitter/nvim-treesitter",
  dev = false,
  build = ":TSUpdate",
  event = "BufReadPost",

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-textsubjects",
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  },
}

local ensure_installed = {
  "bash",
  "c",
  "cmake",
  "cpp",
  "css",
  "diff",
  "gitignore",
  "go",
  "graphql",
  "help",
  "html",
  "http",
  "java",
  "javascript",
  "jsdoc",
  "json",
  "jsonc",
  "latex",
  "lua",
  "markdown",
  "markdown_inline",
  "php",
  "python",
  "regex",
  "rust",
  "scss",
  "sql",
  "svelte",
  "swift",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vue",
  "yaml",
}

function M.setup()
  require("nvim-treesitter.configs").setup({
    ensure_installed = ensure_installed,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<c-n>",
        node_incremental = "<c-n>",
        node_decremental = "<c-m>",
      },
    },
    textsubjects = {
      enable = true,
      keymaps = {
        ["ø"] = "textsubjects-smart",
        ["æ"] = "textsubjects-container-outer",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
  })
end

return M
