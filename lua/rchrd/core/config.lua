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

-- vim.cmd("colorscheme tokyonight-night")

-- Zona de mapeos --
vim.api.nvim_set_keymap("n", "gt", ":bnext<CR>", { noremap = true })
--vim.api.nvim_set_keymap('n', "<C-x", '')
vim.api.nvim_set_keymap("n", "gT", ":bprevious<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<bs>", ":bprevious<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-s>", ":lua Save()<cr>", { noremap = true })

vim.cmd([[
nnoremap <C-x> :RunCode<cr>
]])

vim.g.mapleader = " "

-- require("guess-indent").setup({})

--------------------------------

-- Cuando Neovim se cierra
vim.cmd([[autocmd VimLeave * lua os.execute("pkill -f live-server")]])
