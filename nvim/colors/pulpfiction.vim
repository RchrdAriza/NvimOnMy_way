hi clear

" Pulp Fiction Theme for NeoVim
"
" Author: Rchrd Alv
" URL: https://github.com/RchrdAlv/pulpfiction-nvim-theme

" This theme is based on the Pulp Fiction color scheme for Vim"

set background=dark

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'pulpfiction'

let s_pulp_black = '#000000'
let s_pulp_red = '#a10f0f'
let s_pulp_yellow = '#db7d2f'
let s_pulp_orange = '#f9d500'
let s_pulp_blue = '#31345a'
let s_pulp_blue = '#5861C4'
let s_pulp_pink = '#f38fbe'
let s_pulp_green = '#9ad13e'
let s_pulp_purple = '#5e2d79'
let s_pulp_brown = '#874d31'
let s_pulp_white = '#ffffff'


" indentblankline.
hi IndentBlanklineChar gui=nocombine guifg=#444C55
hi IndentBlanklineSpaceChar cterm=nocombine ctermfg=NONE gui=nocombine guifg=#4d5154
hi IndentBlanklineContextChar gui=nocombine guifg=#FB5E2A
hi IndentBlanklineContextStart gui=underline guisp=#FB5E2A




hi Normal guifg=#FFFFFF guibg=#000000
hi LineNr guifg=#5e2d79
""hi Normal guibg=#232F5A
hi StatusLine guifg=#31345a
hi visual guifg=#f9d500 guibg=#a10f0f
hi Comment guifg=#874d31
hi Constant guifg=#5861C4
hi Identifier guifg=#db7d2f
hi Statement guifg=#f9d500
hi PreProc guifg=#f38fbe
hi Type guifg=#FF6A44
hi Special guifg=#db7d2f
hi Underlined guifg=#f9d500
hi operator guifg=#a10f0f
hi PmenuSel guibg=#db7d2f guifg=#FFFFFF
hi Pmenu guibg=#a10f0f guifg=#FFFFFF
hi PmenuSbar guibg=#f9d500
hi CursorLine   guibg=#3c3836
hi CursorColumn guibg=#3c3836
hi CursorLineNr guifg=#fabd2f
hi StatusLineCmd guifg=#ffffff
hi StatusLineNC guifg=#3c3836
hi StatusLineTerm guifg=#fabd2f
hi StatusLineTermNC guifg=#3c3836
hi Delimiter guifg=#f9d500
hi MatchParen guifg=#db7d2f
hi ErrorMsg guifg=#a10f0f guibg=#ffffff
hi WarningMsg guifg=#a10f0f
hi VertSplit guifg=#f9d500
hi Folded guifg=#f9d500
hi FoldColumn guifg=#f9d500
hi NonText guifg=#31345a
hi SpecialKey guifg=#f9d500
hi Title guifg=#f9d500
hi SpellBad guifg=#a10f0f
hi SpellCap guifg=#f9d500
hi SpellRare guifg=#f38fbe
hi SpellLocal guifg=#9ad13e
hi TabLine guifg=#f9d500
hi TabLineFill guifg=#f9d500
hi TabLineSel guifg=#f9d500
hi TabLineSel guifg=#f9d500
hi TabLineFill guifg=#f9d500
hi TabLine guifg=#f9d500
hi TabLineSel guifg=#f9d500
hi Directory guifg=#a10f0f



"Telescope
hi TelescopePromptTitle guibg=#f9d500 guifg=#a10f0f
hi TelescopeBorder guifg=#f9d500
hi TelescopePromptBorder guifg=#f9d500


" treesitter stuff.
hi @tag.delimiter guifg=#75797a
hi @text.literal guifg=#75797a
hi @text.reference guifg=#fcc25d
hi @text.uri cterm=underline gui=underline guifg=#b194fa
hi @text.strong cterm=bold gui=bold
hi @text.emphasis cterm=italic gui=italic
hi @constructor.python guifg=#9ad13e
hi @field.python guifg=#b8b8ff
hi @variable.builtin.python guifg=#8bd450
hi link @attribute.python Special


