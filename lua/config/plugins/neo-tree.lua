vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>s", "<cmd>Neotree<cr>", desc = "NeoTree" },
  },
  config = {
    close_if_last_window = true,
    enable_git_status = true,
    window = {
      width = 30,
    },
    filesystem = {
      follow_current_file = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git",
        },
      },
    },
  },
  init = function ()
    vim.cmd [[Neotree]]
  end,
}
