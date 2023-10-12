require('packer').startup(function()
    -- packer.nvim se instala a sí mismo
    use 'wbthomason/packer.nvim'

    -- Agrega tus plugins aquí
    use 'neovim/nvim-lspconfig' -- Soporte para LSP (Language Server Protocol)
    use 'hrsh7th/nvim-compe' -- Completado de código
    use 'folke/tokyonight.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'github/copilot.vim'
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    use 'norcalli/nvim-colorizer.lua'
    use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
    use "nvim-lua/plenary.nvim"
    use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use {
  "luukvbaal/nnn.nvim",
  config = function() require("nnn").setup() end
}
    use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}
    use {'nyoom-engineering/oxocarbon.nvim'}
    use 'rktjmp/lush.nvim'
    use 'nvim-lua/popup.nvim'
end
)
