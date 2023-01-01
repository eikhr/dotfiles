return {
  "folke/tokyonight.nvim",
  lazy = false,
  config = {
    style = "night",
  },
  init = function()
    vim.cmd([[colorscheme tokyonight]])
  end,
}
