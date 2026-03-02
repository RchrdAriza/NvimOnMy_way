local opt = vim.opt

opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.signcolumn = "auto"
opt.laststatus = 2
opt.list = true
opt.numberwidth = 1

opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.encoding = "utf-8"
opt.undofile = true

opt.expandtab = true
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.sw = 2

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "" }

local misc = vim.api.nvim_create_augroup("misc", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
	group = misc,
	desc = "Open file at the last position it was edited earlier",
	pattern = "*",
	command = 'silent! normal! g`"zv',
})
