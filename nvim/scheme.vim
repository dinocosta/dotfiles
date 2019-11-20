source $HOME/Developer/dotfiles/nvim/colorschemes/onedark.vim

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

" " StatusLine
" set laststatus=2
" set statusline=
" set statusline+=%{ChangeStatuslineColor()}                                  " Changing the statusline color
" set statusline+=%0*\ %{toupper(g:currentmode[mode()])}                      " Current mode
" set statusline+=%8*%#statusbarcolor#\ %<%t\ %{ReadOnly()}\ %m\ %w\          " File+path
" set statusline+=%9*%#statusbarcolor#\ %=                                    " Space
" set statusline+=%8*%#statusbarcolor#\ %y\                                   " FileType
" set statusline+=%7*%#statusbarcolor#\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\   " Encoding & Fileformat
" set statusline+=%0*\ %3p%%\ \ %l/%L:\ %3c\                                 " Rownumber/total (%)

function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= crystalline#mode() . '%#Fill#'
  endif

  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= crystalline#right_sep('', 'Normal') . ' '
  endif

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif

  if a:width > 80
    let l:s .= ' %{&ft} %l/%L %c%V %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'onedark'

set laststatus=2

" Make comments italic.
hi Comment cterm=italic gui=italic
