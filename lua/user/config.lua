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

function test_function(buf)
  -- Obtener la ruta completa del archivo
  local file_path = vim.api.nvim_buf_get_name(buf)
  -- Extraer solo el nombre del archivo
  local file_name = vim.fn.fnamemodify(file_path, ":t")
  -- Obtener el tipo de archivo usando vim.api.nvim_buf_get_option
  local file_type = vim.api.nvim_buf_get_option(buf, 'filetype')
  -- Imprimir el nombre y el tipo de archivo en la línea de estado
  -- print("El nombre del archivo es " .. file_name .. " y el tipo de archivo es " .. file_type)
   local notify = require("notify")
   notify('Formatted ' .. file_name .. ' file \nType: ' .. file_type, notify.setup{
     render = "compact",
   })
   vim.cmd("silent :Format")

end


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

function live_server()
  local function command_exists(command)
    local handle = io.popen("command -v " .. command)
    local result = handle:read("*a")
    handle:close()
    return result ~= ""
  end

  if command_exists("live-server") then
    -- In case you have the notify plugin installed uncomment the following lines
     local notify = require("notify")
     notify("Starting live server...")
     vim.cmd("silent !live-server . >/dev/null 2>&1 &")
     -- local message = "Starting live server"
     -- vim.api.nvim_echo({{message}}, true, {})
     -- vim.cmd(":")


  else

     local notify = require("notify")
     notify("Live-server is not installed", "error")


  end
end



function stop_live_server()
  local notify = require("notify")
  notify("Stopping live server", "info")
  vim.cmd("silent !pkill -f live-server")
end

function start_grip()
  local function command_exists(command)
    local handle = io.popen("command -v " .. command)
    local result = handle:read("*a")
    handle:close()
    return result ~= ""
  end

  if command_exists("grip") then
    -- You can change the port as you wish
    local port = 5500
    vim.cmd("silent !grip -b % :".. port .. ">/dev/null &")

    local address = "localhost"

    local message = "Grip starting at http://" .. address .. ":" .. port
    -- In case you have the notify plugin installed uncomment the following lines
    local notify = require("notify")
    vim.notify(message)
    -- vim.api.nvim_echo({{message}}, true, {})
  else

     local notify = require("notify")
     notify("Grip is not installed", "error")

  end
end

function stop()
  vim.cmd('silent !pkill -f grip')

  -- In case you have the notify plugin installed uncomment the following lines
  local notify = require("notify")
  vim.notify('Grip has stopped')
  -- local message = "Grip has stopped"
  -- vim.api.nvim_echo({{message}}, true, {})
end

vim.cmd('command Startg lua start_grip()') -- to start grip
vim.cmd('command Stopg lua stop()') -- to stop grip

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

function tkinter()
  vim.cmd("TermExec cmd='DISPLAY=:1 PULSE_SERVER=localhost python %'")
end

vim.cmd('command Tkinter lua tkinter()')

vim.cmd [[
" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

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

-- vim.notify("This is an error message", "error")
-- Cuando Neovim se inicia
-- vim.cmd([[autocmd VimEnter * lua print("Neovim se ha iniciado")]])

-- Cuando Neovim se cierra
vim.cmd([[autocmd VimLeave * lua os.execute("pkill -f live-server")]])
