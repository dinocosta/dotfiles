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
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}' . '%{gutentags#statusline("[", "] ")}'
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

" Prevent neovim from printing all background colors to make it faster.
hi Normal ctermbg=None guibg=None
