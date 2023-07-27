local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
      styles = {
	  terminal_colors = true,
	  comments = { italic = false },
	  keywords = { italic = false },
      },
  },
},
    "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  -- Plugin de Packer para administrar plugins
  {'wbthomason/packer.nvim'},
   {
    'nvim-telescope/telescope.nvim',
    version = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
   {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'kyazdani42/nvim-web-devicons'
  },
    'norcalli/nvim-colorizer.lua',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
  {
  'hrsh7th/nvim-cmp',
  config = function ()
    require'cmp'.setup {
    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },

    sources = {
      { name = 'luasnip' },
      -- more sources
    },
  }
  end
  },
   'L3MON4D3/LuaSnip',
   'saadparwaiz1/cmp_luasnip',
   {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
   {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
   end
  },
   {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end
  },
   {
    'ldelossa/gh.nvim',
    dependencies = { 'ldelossa/litee.nvim' }
  },
   'tpope/vim-fugitive',

-- if use nvim-web-devicons
   {
  'yamatsum/nvim-nonicons',
  dependencies = {'kyazdani42/nvim-web-devicons'}
  },
  -- Packer
   { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
   {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
  },
   {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  },
   "rafamadriz/friendly-snippets",
   "lukas-reineke/indent-blankline.nvim",
--    {
--   "NvChad/nvterm",
--   config = function ()
--     require("nvterm").setup()
--   end,
-- }
    'kyazdani42/nvim-web-devicons',
    "nvim-lua/plenary.nvim",
   -- "RchrdAriza/pulpFictionNvim-Theme",
    'rcarriga/nvim-notify',
   -- using packer.nvim
   {
  'nmac427/guess-indent.nvim',
  config = function() require('guess-indent').setup {} end,
},
   {
      'stevearc/aerial.nvim',
      config = function() require('aerial').setup() end
    },
     {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
},
    'CRAG666/code_runner.nvim',
    'yamatsum/nvim-cursorline',
    {
  'jghauser/mkdir.nvim'
},
    'MunifTanjim/nui.nvim',
    'marko-cerovac/material.nvim',
    {"akinsho/toggleterm.nvim", version = '*', config = function()
  require("toggleterm").setup()
end},
   {
    "folke/trouble.nvim",
    require = 'kyazdani42/nvim-web-devicons'
  },
  { 'rose-pine/neovim', name = 'rose-pine' },

   'pocco81/auto-save.nvim',
   'tomasiser/vim-code-dark',
   'famiu/bufdelete.nvim',
   { 'mhartington/formatter.nvim' },
   {'akinsho/git-conflict.nvim', version = "*", config = function()
  require('git-conflict').setup()
end},
   'adelarsq/image_preview.nvim',
   {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig"
  },

  {
  "utilyre/barbecue.nvim",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "kyazdani42/nvim-web-devicons", -- optional dependency
  },
  config = function()
    require("barbecue").setup()
  end,
},
 {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
},

 {
   'stevearc/dressing.nvim',
   opts = {},
 },
 'mfussenegger/nvim-dap',
 {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  {
      'lewis6991/gitsigns.nvim',
      config = function()
	  require('gitsigns').setup()
      end,
  },
  'tpope/vim-surround',
  'windwp/nvim-ts-autotag',
  {
      "petertriho/cmp-git",
       dependencies = "nvim-lua/plenary.nvim"
  },
})
