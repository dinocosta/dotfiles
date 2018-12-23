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

colorscheme onehalflight
set background=light

" Change dropdown menu colors.
highlight Pmenu ctermbg=black ctermfg=white
highlight PmenuSel ctermbg=gray ctermfg=black

" StatusLine
highlight statusbarcolor ctermfg=white ctermbg=black
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
    exe 'hi! StatusLine ctermfg=255'
    exe 'hi! StatusLine ctermbg=010'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermbg=005'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermbg=004'
  else
    exe 'hi! StatusLine ctermbg=010'
  endif

  return ''
endfunction

" Matched words colors.
highlight Search cterm=None ctermfg=white ctermbg=black

" Python highlighting.
highlight pythonDecorator ctermfg=127
highlight pythonStatement ctermfg=127
highlight pythonNumber ctermfg=215
highlight pythonException ctermfg=127
highlight pythonOperator ctermfg=127
highlight pythonConditional ctermfg=127
highlight pythonCls ctermfg=167
highlight pythonExceptions ctermfg=215
highlight pythonFor ctermfg=127
highlight pythonWhile ctermfg=127

" Whitespace characters.
hi NonText ctermfg=245 guifg=70

" Change color of indent lines.
let g:indentLine_color_term = 245