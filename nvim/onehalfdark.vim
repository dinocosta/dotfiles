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

" Colorscheme
colorscheme onehalfdark
set background=dark

" Background color.
highlight Normal ctermfg=188 ctermbg=0

" Line number.
highlight LineNr ctermfg=247 ctermbg=0

" StatusLine
highlight statusbarcolor ctermfg=black ctermbg=white
set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}                  " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}      " Current mode
set statusline+=%8*%#statusbarcolor#\ %<%F\ %{ReadOnly()}\ %m\ %w\           " File+path
set statusline+=%9*%#statusbarcolor#\ %=                                     " Space
set statusline+=%8*%#statusbarcolor#\ %y\                                    " FileType
set statusline+=%7*%#statusbarcolor#\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\    " Encoding & Fileformat
set statusline+=%0*\ %3p%%\ \ %l/%L:\ %3c\                 " Rownumber/total (%)

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
    exe 'hi! StatusLine ctermfg=010'
  endif

  return ''
endfunction

" Matched words colors.
highlight Search cterm=None ctermfg=black ctermbg=253
"
" Current line
hi CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

" Whitespace characters
hi NonText ctermfg=240 guifg=70

" Change color of indent lines.
let g:indentLine_color_term = 240

" Change color of search results.
hi Search ctermbg=red ctermfg=8
