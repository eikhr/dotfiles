return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  init = function()
    vim.g.undotree_WindowLayout = 3
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
  keys = {
    { "<leader>u", ":UndotreeToggle<cr>" },
  },
}
