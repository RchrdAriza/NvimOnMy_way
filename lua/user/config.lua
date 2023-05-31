vim.o.number = true 
vim.o.relativenumber = false
vim.o.swapfile = false 
vim.o.encoding = "utf-8" 
vim.o.undofile = true 
vim.o.sw = 4 
vim.o.showmatch = true 
vim.o.laststatus = 2 
vim.cmd("syntax on") 
vim.cmd.fillchars = "vert:│"
vim.o.termguicolors = true

-- Descomentar para usar el material colorscheme
--vim.g.material_style = "deep ocean"

vim.cmd('colorscheme rose-pine')


-- vim.cmd [[
-- 	inoremap [ []<Left>
-- 	inoremap " ""<Left>
-- 	inoremap { {}<Left>
-- 	inoremap ( ()<Left>
-- ]]
--
require'colorizer'.setup()

vim.g.mapleader = " "

local async = require "plenary.async"

--vim.g.indent_blankline_exclude_children = 0
vim.g.indent_blankline_exclude_children = false




require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

vim.notify = require("notify")
require("notify")("Welcome")
require('guess-indent').setup {}

--------------------------------
require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')

require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

vim.cmd [[
" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
]]
