-- Configuración inicial de Packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end


require('packer').startup(function()
  -- Plugin de Packer para administrar plugins
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use 'norcalli/nvim-colorizer.lua'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  }
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
   end
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons' -- optional
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end
  }
  use {
    'ldelossa/gh.nvim',
    requires = { 'ldelossa/litee.nvim' }
  }
  use 'tpope/vim-fugitive'
  use 'github/copilot.vim'


-- if use nvim-web-devicons
  use {
  'yamatsum/nvim-nonicons',
  requires = {'kyazdani42/nvim-web-devicons'}
  }
  -- Packer
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use "rafamadriz/friendly-snippets"
  use "lukas-reineke/indent-blankline.nvim"
  use 'tamago324/lir.nvim'
--   use {
--   "NvChad/nvterm",
--   config = function ()
--     require("nvterm").setup()
--   end,
-- }
   use 'kyazdani42/nvim-web-devicons'
   use "nvim-lua/plenary.nvim"
   use "RchrdAlv/pulpFictionNvim-Theme"
   use 'rcarriga/nvim-notify'
   -- using packer.nvim
use {
  'nmac427/guess-indent.nvim',
  config = function() require('guess-indent').setup {} end,
}
use {
      'stevearc/aerial.nvim',
      config = function() require('aerial').setup() end
    }
    use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
   use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
}
   use 'CRAG666/code_runner.nvim'
   use 'yamatsum/nvim-cursorline'
   use {
  'jghauser/mkdir.nvim'
}
   use 'MunifTanjim/nui.nvim'
   use 'marko-cerovac/material.nvim'
   use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
end}
  use {
    "folke/trouble.nvim",
    require = 'kyazdani42/nvim-web-devicons'
  }
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use 'pocco81/auto-save.nvim'
  use "lukas-reineke/cmp-under-comparator"
  use {
  "potamides/pantran.nvim"
  }
  use 'tomasiser/vim-code-dark'
end)

