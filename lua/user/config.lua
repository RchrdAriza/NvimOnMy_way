vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
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

-- vim.o.statusline+=%{get(b:,'gitsigns_status','')

-- Descomentar para usar el material colorscheme
--vim.g.material_style = "deep ocean"

vim.cmd("colorscheme tokyonight-night")

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
nnoremap <silent> ff :lua test_function(0)<CR>
nnoremap <silent> <leader>F :FormatWrite<CR>

" augroup FormatAutogroup
"   autocmd!
"   autocmd BufWritePost * FormatWrite
" augroup END

]])

require("image_preview").setup({})

vim.g.mapleader = " "

local async = require("plenary.async")

--vim.g.indent_blankline_exclude_children = 0
-- vim.g.indent_blankline_exclude_children = false

--[[ require("indent_blankline").setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	show_current_context_start = true,
}) ]]

require("ibl").setup()

wnotify = require("notify")

wnotify.setup({
	stages = "fade",
	render = "compact",
})

wnotify("Welcome")

require("guess-indent").setup({})

--------------------------------
require("aerial").setup({
	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,
})
-- You probably also want to set a keymap to toggle aerial
--vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')

-- vim.notify("This is an error message", "error")
-- Cuando Neovim se inicia
-- vim.cmd([[autocmd VimEnter * nno]])

-- Cuando Neovim se cierra
vim.cmd([[autocmd VimLeave * lua os.execute("pkill -f live-server")]])

require("yanky").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
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
require 'colorizer'.setup {
  '*'; -- Highlight all files, but customize some others.
  css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
  css = { names = true; }; -- Enable parsing rgb(...) functions in css.
  html = { names = true; } -- Disable parsing "names" like Blue or Gray
}
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

vim.cmd([[
hi default link UfoPreviewSbar PmenuSbar
hi default link UfoPreviewThumb PmenuThumb
hi default link UfoPreviewWinBar UfoFoldedBg
hi default link UfoPreviewCursorLine Visual
hi default link UfoFoldedEllipsis Comment
hi default link UfoCursorFoldedLine CursorLine]])

require('hlslens').setup()

local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)


require 'nvim-web-devicons'.setup {}

