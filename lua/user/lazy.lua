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
    ui = {
        border = 'rounded',
        icons = {
            lazy = '💤',
        },
    },
    checker = {
        enabled = true,
        concurrency = 100,
    },
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
   {
    'nvim-telescope/telescope.nvim',
    version = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
   {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'RchrdAriza/nvim-web-devicons'
  },
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
    dependencies = { 'RchrdAriza/nvim-web-devicons' },
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
   'RchrdAriza/nvim-web-devicons',

-- if use nvim-web-devicons
  -- "RchrdAriza/nvim-web-devicons",
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
    'RchrdAriza/nvim-web-devicons',
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
   "gbprod/yanky.nvim",
   {
    "folke/trouble.nvim",
    dependencies = 'RchrdAriza/nvim-web-devicons'
  },
  { 'rose-pine/neovim', name = 'rose-pine' },

   'pocco81/auto-save.nvim',
   'famiu/bufdelete.nvim',
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
    "RchrdAriza/nvim-web-devicons", -- optional dependency
  },
  config = function()
    require("barbecue").setup()
  end,
},
 {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'RchrdAriza/nvim-web-devicons', lazy = true }
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
      "RchrdAriza/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  {
      'lewis6991/gitsigns.nvim',
      config = function()
	  require('gitsigns').setup()
      end,
  },
  'windwp/nvim-ts-autotag',
  {
      "petertriho/cmp-git",
       dependencies = "nvim-lua/plenary.nvim"
  },

    { 'mhartington/formatter.nvim' },
    {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
},
    'HiPhish/rainbow-delimiters.nvim',
    'norcalli/nvim-colorizer.lua',
    "LudoPinelli/comment-box.nvim",
    {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
   },
  "xiyaowong/telescope-emoji.nvim",
    {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },
    event = "BufReadPost",
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },

    init = function()
      vim.keymap.set("n", "zR", function()
        require("ufo").openAllFolds()
      end)
      vim.keymap.set("n", "zM", function()
        require("ufo").closeAllFolds()
      end)
    end,
  },
{ 'anuvyklack/fold-preview.nvim',
   dependencies = 'anuvyklack/keymap-amend.nvim',
   config = function()
      require('fold-preview').setup({
         -- Your configuration goes here
	 -- auto = 400,
      })
   end
},
{
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
},
  'kevinhwang91/nvim-hlslens',
  'mfussenegger/nvim-jdtls',
  'eruizc-dev/jdtls-launcher',
  'mfussenegger/nvim-fzy',
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      -- options
    },
  },
  "lukas-reineke/cmp-under-comparator",
  "RchrdAriza/nvim-web-devicons",
  {
  "j-hui/fidget.nvim",
  opts = {
    -- options
  },
},
})
