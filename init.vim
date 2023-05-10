source ~/.config/nvim/coc_config.lua

set number
set relativenumber
set noswapfile
set encoding=utf-8
set undofile
set sw=4
set showmatch
set laststatus=2
syntax on

call plug#begin('~/.local/share/nvim/plugged')

    Plug 'folke/tokyonight.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'SmiteshP/nvim-navic'
    Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'mhinz/vim-startify'
    Plug 'github/copilot.vim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

call plug#end()


colorscheme tokyonight

nnoremap <silent> <C-n> :NvimTreeToggle<CR>
nnoremap <silent> <C-f> :CHADopen<CR>

inoremap ' ''<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap { {}<Left>
inoremap ( ()<Left>
set termguicolors

lua << END
require('lualine').setup()
local async = require "plenary.async"

vim.opt.termguicolors = true
require("bufferline").setup{}
END

let g:python3_host_prog = '/usr/bin/python3'

 
 function! CenterText(text) 
   let winwidth = winwidth(0) 
   let textwidth = strlen(a:text) 
   let pad = (winwidth - textwidth) / 2 
   return repeat(' ', pad) . a:text 
endfunction

let g:startify_custom_header = [ 
         \'███╗░░██╗██╗░░░██╗██╗███╗░░░███╗', 
         \'████╗░██║██║░░░██║██║████╗░████║', 
         \'██╔██╗██║╚██╗░██╔╝██║██╔████╔██║', 
         \'██║╚████║░╚████╔╝░██║██║╚██╔╝██║', 
         \'██║░╚███║░░╚██╔╝░░██║██║░╚═╝░██║', 
         \'╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝', 
         \'', 
         \'█▀█ █▄░█ █▀▄▀█ █▄█', 
         \'█▄█ █░▀█ █░▀░█ ░█░', 
         \'', 
         \'░██╗░░░░░░░██╗░█████╗░██╗░░░██╗', 
         \'░██║░░██╗░░██║██╔══██╗╚██╗░██╔╝', 
         \'░╚██╗████╗██╔╝███████║░╚████╔╝░', 
         \'░░████╔═████║░██╔══██║░░╚██╔╝░░', 
         \'░░╚██╔╝░╚██╔╝░██║░░██║░░░██║░░░', 
         \'░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝░░░╚═╝░░░', ] 

let g:startify_centered = 1
let g:startify_padding_left = 15 
let g:startify_padding_top = (winheight(0) - 10) / 2 
let g:startify_files_number = 5


let mapleader = "."

 let g:startify_lists = [ 
       \ { 'type': 'files', 'header': ['   recent files'] }, 
       \ { 'type': 'sessions', 'header': ['   Sesiones'] }, 
       \ { 'type': 'bookmarks', 'header': ['   Marcadores'] }, 
       \ { 'type': 'commands', 'header': ['   Comandos'] }, 
       \ { 'type': 'dir', 'header': ['   File Browser'], 'path': '~/Projects' } 
       \ ] 
 
let g:coc_global_extensions = [ "coc-pyright", "coc-json", "coc-tsserver", "coc-sh", "coc-css" ]

let g:startify_custom_header = map(g:startify_custom_header, 'repeat(" ", (&columns - strdisplaywidth(v:val)) / 2) . v:val')

lua << EOF
require'nvim-treesitter.configs'.setup{
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
}  
EOF
