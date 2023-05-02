vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.o.encoding = "utf-8"
vim.o.undofile = true
vim.o.sw = 4
vim.o.showmatch = true
vim.o.laststatus = 2
vim.cmd("syntax on")


vim.cmd('colorscheme tokyonight')
vim.cmd [[
    inoremap " ""<Left>
    inoremap ' ''<Left>
    inoremap [ []<Left>
    inoremap { {}<Left>
    inoremap ( ()<Left>
]]

local async = require "plenary.async"

vim.cmd [[

nnoremap <C-a> <cmd>NnnExplorer %:p:h<CR>

nnoremap <C-A-p> <cmd>NnnPicker<CR>
]]

