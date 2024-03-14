local o = vim.o

vim.opt.termguicolors = true
o.number = true
o.relativenumber = true
o.swapfile = false
o.encoding = "utf-8"
o.undofile = true
o.sw = 2
o.showmatch = true
o.laststatus = 2
vim.cmd("syntax on")
vim.opt.list = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.o.statusline+=%{get(b:,'gitsigns_status','')
vim.opt.clipboard = "unnamedplus"

o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2

vim.cmd([[
nnoremap <C-x> :RunCode<cr>
]])

vim.g.mapleader = " "

-- require("guess-indent").setup({})

--------------------------------

-- Cuando Neovim se cierra
-- vim.cmd([[autocmd VimLeave * lua os.execute("pkill -f live-server")]])

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	group = misc_augroup,
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

-- vim.diagnostic.config({
-- 	virtual_text = false,
-- 	float = {
-- 		source = "always",
-- 		border = border,
-- 	},
-- })
