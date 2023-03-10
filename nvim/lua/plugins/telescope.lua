local function project_files()
  local opts = {}
  if vim.loop.fs_stat(".git") then
    opts.show_untracked = true
    require("telescope.builtin").git_files(opts)
  else
    local client = vim.lsp.get_active_clients()[1]
    if client then
      opts.cwd = client.config.root_dir
    end
    require("telescope.builtin").find_files(opts)
  end
end

local M = {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader><space>", project_files, desc = "Find File" },
  },
}

function M.config()
  local telescope = require("telescope")
  local borderless = true
  telescope.setup({
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<C-k>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-j>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
        },
      },
      winblend = borderless and 0 or 10,
    },
    extensions = {
      fzf = {
        case_mode = "smart_case",
      },
    },
  })
  telescope.load_extension("fzf")
end

return M
