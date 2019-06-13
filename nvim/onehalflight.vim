set termguicolors
syntax on
set t_Co=256
colorscheme onehalflight

" StatusLine
highlight statusbarcolor ctermfg=white ctermbg=black guibg=#383a42 guifg=#fafafa
set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}                                  " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}                      " Current mode
set statusline+=%8*%#statusbarcolor#\ %<%F\ %{ReadOnly()}\ %m\ %w\          " File+path
set statusline+=%9*%#statusbarcolor#\ %=                                    " Space
set statusline+=%8*%#statusbarcolor#\ %y\                                   " FileType
set statusline+=%7*%#statusbarcolor#\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\   " Encoding & Fileformat
set statusline+=%0*\ %3p%%\ \ %l/%L:\ %3c\                                 " Rownumber/total (%)

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=255 ctermbg=010 guibg=#0184bc guifg=#fafafa'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermbg=005 guibg=#c18401 guifg=#fafafa'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermbg=004 guibg=#50a14f guifg=#fafafa'
  else
    exe 'hi! StatusLine ctermbg=010'
  endif

  return ''
endfunction

" Matched words colors.
highlight Search cterm=None ctermfg=white ctermbg=black guibg=#e45649 guifg=#fafafa

" Whitespace characters.
hi NonText ctermfg=245 guifg=#a0a1a7

" Change dropdown menu colors.
highlight Pmenu ctermbg=black ctermfg=white guibg=#f0f0f0 guifg=#383a42
highlight PmenuSel ctermbg=gray ctermfg=black guibg=#0184bc guifg=#f0f0f0

" Change color of indent lines.
let g:indentLine_color_term = 245

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
