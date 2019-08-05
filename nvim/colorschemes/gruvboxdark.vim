set termguicolors
syntax on
set t_Co=256

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine guifg=#ebdbb2 guibg=#282828'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine guifg=#282c34 guibg=#98c379'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine guifg=#282828 guibg=#98971a'
  elseif (mode() ==# 'r')
    exe 'hi! StatusLine guifg=#282c34 guibg=#98c379'
  else
    exe 'hi! StatusLine guifg=#282828 guibg=#ebdbb2'
  endif

  return ''
endfunction

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
