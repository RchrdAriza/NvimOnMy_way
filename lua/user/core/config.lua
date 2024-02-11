vim.opt.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.o.encoding = "utf-8"
vim.o.undofile = true
vim.o.sw = 2
vim.o.showmatch = true
vim.o.laststatus = 2
vim.cmd("syntax on")
vim.opt.list = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.o.statusline+=%{get(b:,'gitsigns_status','')
vim.opt.clipboard = "unnamedplus"

vim.cmd([[
nnoremap <C-x> :RunCode<cr>
]])

vim.g.mapleader = " "

-- require("guess-indent").setup({})

--------------------------------

-- Cuando Neovim se cierra
vim.cmd([[autocmd VimLeave * lua os.execute("pkill -f live-server")]])

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	group = misc_augroup,
	pattern = "*",
	command = 'silent! normal! g`"zv',
})
