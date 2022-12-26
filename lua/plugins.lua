-- Install packer if not already installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Add packages
return require('packer').startup(function(use)
  -- Impatient...
  use { "lewis6991/impatient.nvim", config = [[require('impatient')]] }

  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'marko-cerovac/material.nvim'

  -- Move lines
  use 'fedepujol/move.nvim' 

  -- Navigate within file
  use 'ggandor/lightspeed.nvim'

  -- Terminal
  use 'voldikss/vim-floaterm'

  -- LazyGit
  use 'kdheepak/lazygit.nvim'

  -- Status bar line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = [[require('config.lualine')]],
  }

  -- Sidebar
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = [[require('config.neotree')]],
  }

  -- Highlight, edit, and navigate
  use {
    'nvim-treesitter/nvim-treesitter',
    event = "BufEnter",
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = [[require('config.treesitter')]],
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use {
    'windwp/nvim-ts-autotag',
    after = 'nvim-treesitter',
  }

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = [[require('config.comment')]],
  }
  
  -- Formatting
  use { 'sbdchd/neoformat', cmd = 'Neoformat' }
  
  -- GitHub copilot
  use 'github/copilot.vim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

