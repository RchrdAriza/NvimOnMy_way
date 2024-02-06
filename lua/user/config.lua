vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- vim.o.guifont = "Monaspace Neon"
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
vim.o.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.foldmethod = "foldlevel"
vim.notify = require("notify")
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.signcolumn = "auto"
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	group = misc_augroup,
	pattern = "*",
	command = 'silent! normal! g`"zv',
})
-- Descomentar para usar el material colorscheme
--vim.g.material_style = "deep ocean"

vim.cmd("colorscheme tokyonight-night")

vim.keymap.set("n", "<space>j", vim.diagnostic.open_float)

-- Zona de mapeos --
vim.api.nvim_set_keymap("n", "gt", ":bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gT", ":bprevious<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<bs>", ":bprevious<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-s>", ":lua Save()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-x>", ":RunCode<cr>", { noremap = true })

require("image_preview").setup()

vim.g.mapleader = " "

require("ibl").setup()

require("notify").setup({
	stages = "fade",
	-- render = "compact",
})

-- local wnotify = require("notify")
--
-- wnotify("Welcome")

require("guess-indent").setup({})

--------------------------------
require("aerial").setup({
	on_attach = function(bufnr)
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,
})

-- Cuando Neovim se cierra
vim.cmd([[autocmd VimLeave * lua os.execute("pkill -f live-server")]])

require("yanky").setup({
	ring = {
		history_length = 100,
		storage = "shada",
		sync_with_numbered_registers = true,
		cancel_event = "update",
		ignore_registers = { "_" },
	},
	system_clipboard = {
		sync_with_ring = true,
	},
})

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

--
--
require("colorizer").setup({
	"*",
	css = { names = true, rgb_fn = true },
	html = { names = true },
})
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

vim.cmd([[
hi default link UfoPreviewSbar PmenuSbar
hi default link UfoPreviewThumb PmenuThumb
hi default link UfoPreviewWinBar UfoFoldedBg
hi default link UfoPreviewCursorLine Visual
hi default link UfoFoldedEllipsis Comment
hi default link UfoCursorFoldedLine CursorLine]])

require("hlslens").setup()

local kopts = { noremap = true, silent = true }

vim.api.nvim_set_keymap(
	"n",
	"n",
	[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
	kopts
)
vim.api.nvim_set_keymap(
	"n",
	"N",
	[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
	kopts
)
vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
-- vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
-- vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

-- vim.api.nvim_set_keymap("n", "<Leader>l", "<Cmd>noh<CR>", kopts)

require("nvim-web-devicons").setup({})
