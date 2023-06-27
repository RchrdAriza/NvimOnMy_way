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
nnoremap <C-c> :bdelete<cr>
]]

require("image_preview").setup({})

require'colorizer'.setup()

vim.g.mapleader = "."

local async = require "plenary.async"

--vim.g.indent_blankline_exclude_children = 0
vim.g.indent_blankline_exclude_children = false




require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

-- vim.notify = require("notify")
require("notify")("Welcome")
require('guess-indent').setup {}

-- function live_server()
--   local notifi = require("notify")
--   notifi("Starting live server...")
--   vim.cmd("silent !live-server . >/dev/null 2>&1 &")
-- end
function live_server()

  -- In case you have the notify plugin installed uncomment the following lines
  -- local notify = require("notify")
  -- notify("Starting live server...")
  vim.cmd("silent !live-server . >/dev/null 2>&1 &")
  local message = "Starting live server"
  vim.api.nvim_echo({{message}}, true, {})
end


function stop_live_server()
  local notify = require("notify")
  notify("Stopping live server")
  vim.cmd("silent !pkill -f live-server")
end

function start_grip()
  local port = 5500
  vim.cmd("silent !grip -b % :".. port .. ">/dev/null &")

  local address = "localhost"
  local notification = "Grip starting at http://" .. address .. ":" .. port
  vim.notify(notification)
end


function stop()
  vim.cmd('silent !pkill -f grip')

  vim.notify('Grip has stopped')
end 

function Save()
  vim.cmd('w')
  vim.notify('Saved file')
end
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

function hightlight()
  vim.cmd('TSEnable highlight')
end


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

-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })

