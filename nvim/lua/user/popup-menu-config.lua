let g:popup_menu_items = [
    \['Explorer', ':NvimTreeToggle'],
    \['Fuzzy Finder', ':Files'],
    \['Quit', ':qa!'],
\]

nnoremap <silent> <Space> :call ShowPopupMenu(g:popup_menu_items)<CR>


function! ShowPopupMenu(items)
  let options = {
        \ 'relative': 'cursor',
        \ 'anchor': 'sw',
        \ 'width': max(map(copy(a:items), {_,v -> strdisplaywidth(v[0])}))+4,
        \ 'height': len(a:items) + 2,
        \ }
  let lines = [''] + map(copy(a:items), {k,v -> printf(" %s", v[0])}) + ['']
  let cmd = join(map(copy(a:items), {k,v -> printf(":%s<CR>", v[1])}), '')
  call popup_create(lines, options)
  setlocal cursorline
  execute "normal! \<Esc>"
  call feedkeys(cmd)
endfunction

