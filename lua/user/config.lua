vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
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
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.foldmethod="foldlevel"
vim.notify = require("notify")
-- vim.o.statusline+=%{get(b:,'gitsigns_status','')

-- Descomentar para usar el material colorscheme
--vim.g.material_style = "deep ocean"

vim.cmd('colorscheme tokyonight-night')

-- Zona de mapeos --
vim.api.nvim_set_keymap('n', 'gt', ':bnext<CR>', {noremap = true} )
--vim.api.nvim_set_keymap('n', "<C-x", '')
vim.api.nvim_set_keymap('n', 'gT', ":bprevious<cr>", {noremap = true})
vim.api.nvim_set_keymap('n', '<Tab>', ":bnext<cr>", {noremap = true} )
vim.api.nvim_set_keymap('n', '<bs>', ":bprevious<cr>", {noremap = true} )
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true} )
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true} )
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true} )
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true} )
vim.api.nvim_set_keymap('n', '<C-s>', ':lua Save()<cr>', {noremap = true})

vim.cmd [[
nnoremap <C-x> :RunCode<cr>
nnoremap <silent> ff :lua test_function(0)<CR>
nnoremap <silent> <leader>F :FormatWrite<CR>

" augroup FormatAutogroup
"   autocmd!
"   autocmd BufWritePost * FormatWrite
" augroup END

]]



require("image_preview").setup({})

require'colorizer'.setup({

  '*'; -- Highlight all files, but customize some others.
  css = { css = true; }; -- Enable parsing rgb(...) functions in css.
})

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
vim.notify.setup({
  stages = "fade",
  render = "compact",
  -- title = "bienvenida"
})
vim.notify("Welcome")
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
--vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')



-- vim.notify("This is an error message", "error")
-- Cuando Neovim se inicia
-- vim.cmd([[autocmd VimEnter * lua print("Neovim se ha iniciado")]])

-- Cuando Neovim se cierra
vim.cmd([[autocmd VimLeave * lua os.execute("pkill -f live-server")]])





