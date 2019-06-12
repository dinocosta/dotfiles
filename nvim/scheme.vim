let g:currentmode={
      \ 'n'  : 'N ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'V ',
      \ 'V'  : 'V·Line ',
      \ '' : 'V·Block ',
      \ 's'  : 'Select ',
      \ 'S'  : 'S·Line ',
      \ '^S' : 'S·Block ',
      \ 'i'  : 'I ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \ 't'  : 'Terminal '
      \}" Colorscheme

" Check if file is read only and return a specific
" character if it is, in order to be displayed on the status line.
function! ReadOnly()
  if &readonly || !&modifiable
    return '🔒'
  else
    return ''
endfunction

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=010'
    exe 'hi! StatusLine ctermbg=000'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=005'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004'
  else
    exe 'hi! StatusLine ctermfg=255'
  endif

  return ''
endfunction

set termguicolors
syntax on
set t_Co=256
colorscheme onehalfdark

" StatusLine
hi statusbarcolor ctermfg=black ctermbg=white guifg=black guibg=white
set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}                  " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}      " Current mode
set statusline+=%8*%#statusbarcolor#\ %<%F\ %{ReadOnly()}\ %m\ %w\           " File+path
set statusline+=%9*%#statusbarcolor#\ %=                                     " Space
set statusline+=%8*%#statusbarcolor#\ %y\                                    " FileType
set statusline+=%7*%#statusbarcolor#\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\    " Encoding & Fileformat
set statusline+=%0*\ %3p%%\ \ %l/%L:\ %3c\                 " Rownumber/total (%)

" Matched words colors.
hi Search cterm=None ctermfg=black ctermbg=253 guifg=#000000 guibg=#dadada
"
" Current line
hi CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

" Whitespace characters
hi NonText ctermfg=240 guifg=#585858

" Change color of indent lines.
let g:indentLine_color_term=240

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'String'],
  \ 'fg+':     ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Function'],
  \ 'pointer': ['fg', 'Keyword'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
