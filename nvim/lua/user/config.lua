vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.o.encoding = "utf-8"
vim.o.undofile = true
vim.o.sw = 4
vim.o.showmatch = true
vim.o.laststatus = 2
vim.cmd("syntax on")
vim.cmd.fillchars = "vert:│"

--vim.opt.background = "dark" -- set this to dark or light
--vim.cmd("colorscheme oxocarbon")

vim.cmd [[
    inoremap " ""<Left>
    inoremap ' ''<Left>
    inoremap [ []<Left>
    inoremap { {}<Left>
    inoremap ( ()<Left>
    nnoremap <leader>v <cmd>CHADopen<cr>
]]

local async = require "plenary.async"

vim.cmd [[    
    colorscheme tokyonight
]]

vim.cmd [[
    call plug#begin('~/.local/share/nvim/plugged')

	Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

    call plug#end()
    
]]

vim.cmd [[
	function! CustomPlugInstall() abort
  " Limpia la pantalla
  silent !clear
  " Inicia la instalación de plugins
  echo "Instalando plugins..."
  echo ""
  " Ejecuta PlugInstall silenciosamente y redirige la salida a un búfer temporal
  redir => plug_output
    silent! PlugInstall
  redir END
  " Procesa la salida de PlugInstall y muestra mensajes de instalación personalizados
  for line in split(plug_output, '\n')
    if line =~# 'Updated. Elapsed time:'
      " Muestra el tiempo transcurrido
      echo line
    elseif line =~# '- Finishing ... Done!'
      " Muestra un mensaje al finalizar la instalación
      echo "Todos los plugins se han instalado correctamente."
    elseif line =~# 'x '
      " Muestra un mensaje de error si la instalación falló
      echohl ErrorMsg
      echo "Error: " . line
      echohl None
    endif
  endfor
endfunction
]]

vim.cmd [[

	function! CustomPackInstall() abort
  " Limpia la pantalla
  silent !clear
  " Inicia la instalación de plugins
  echo "Instalando plugins..."
  echo ""
  " Ejecuta PackerInstall silenciosamente y redirige la salida a un búfer temporal
  redir => pack_output
    silent! PackerInstall
  redir END
  " Procesa la salida de PackerInstall y muestra mensajes de instalación personalizados
  for line in split(pack_output, '\n')
    if line =~# 'Elapsed time:'
      " Muestra el tiempo transcurrido
      echo line
    elseif line =~# '->'
      " Muestra un mensaje de instalación de paquetes
      echo "Instalando " . substitute(line, '^->\s*', '', '') . "..."
    elseif line =~# 'Package(s) not found:'
      " Muestra un mensaje de error si un paquete no se encuentra
      echohl ErrorMsg
      echo "Error: " . substitute(line, '^Package(s) not found: ', '', '')
      echohl None
    elseif line =~# 'Already installed:'
      " Muestra un mensaje si un paquete ya está instalado
      echo "Ya se encuentra instalado: " . substitute(line, '^Already installed: ', '', '')
    endif
  endfor
  " Muestra un mensaje al finalizar la instalación
  echo "Todos los paquetes se han instalado correctamente."
endfunction


]]
