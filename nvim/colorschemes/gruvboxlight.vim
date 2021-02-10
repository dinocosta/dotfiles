set termguicolors
syntax on
set t_Co=256
set background=light

" Colorscheme configurations.
" Keep the `colorscheme` call at the end otherwise
" the configuration will be ignored.
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_italic = 1
colorscheme gruvbox

" Crystalline status bar configuration.
let g:crystalline_theme = 'gruvbox'

" Change color of indent lines.
let g:indentLine_color_term=240

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'String'],
  \ 'fg+':     ['fg', 'String'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl+':     ['fg', 'String'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Function'],
  \ 'pointer': ['fg', 'Keyword', 'bg', 'CursorLine'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Function']}

" Change color of vertical split separator for NerdTree.
hi VertSplit guifg=#abb2bf

" Set Coc colors based on other highlight groups for consistency.
exec 'hi CocErrorSign guifg=' . synIDattr(hlID('GruvboxRed'), 'fg')
exec 'hi CocWarningSign guifg=' . synIDattr(hlID('GruvboxYellow'), 'fg')
