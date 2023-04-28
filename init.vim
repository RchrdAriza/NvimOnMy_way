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
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'github/copilot.vim'

call plug#end()


colorscheme tokyonight-moon

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
       \ { 'type': 'files', 'header': ['   Archivos recientes'] }, 
       \ { 'type': 'sessions', 'header': ['   Sesiones'] }, 
       \ { 'type': 'bookmarks', 'header': ['   Marcadores'] }, 
       \ { 'type': 'commands', 'header': ['   Comandos'] }, 
       \ { 'type': 'dir', 'header': ['   Explorador de archivos'], 'path': '~/Projects' } 
       \ ] 
 
let g:coc_global_extensions = [ "coc-pyright", "coc-json", "coc-tsserver", "coc-sh", "coc-css" ]

let g:startify_custom_header = map(g:startify_custom_header, 'repeat(" ", (&columns - strdisplaywidth(v:val)) / 2) . v:val')
