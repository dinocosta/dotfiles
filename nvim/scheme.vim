" Check if file is read only and return a specific
" character if it is, in order to be displayed on the status line.
function! ReadOnly()
  if &readonly || !&modifiable
    return '🔒'
  else
    return ''
endfunction

so $HOME/.dotfiles/nvim/onehalfdark.vim
