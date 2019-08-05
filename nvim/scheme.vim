source $HOME/Developer/dotfiles/nvim/colorschemes/gruvboxdark.vim

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
      \}

" Check if file is read only and return a specific
" character if it is, in order to be displayed on the status line.
function! ReadOnly()
  if &readonly || !&modifiable
    return '🔒'
  else
    return ''
endfunction

" StatusLine
set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}                                  " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}                      " Current mode
set statusline+=%8*%#statusbarcolor#\ %<%f\ %{ReadOnly()}\ %m\ %w\          " File+path
set statusline+=%9*%#statusbarcolor#\ %=                                    " Space
set statusline+=%8*%#statusbarcolor#\ %y\                                   " FileType
set statusline+=%7*%#statusbarcolor#\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\   " Encoding & Fileformat
set statusline+=%0*\ %3p%%\ \ %l/%L:\ %3c\                                 " Rownumber/total (%)
