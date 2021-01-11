set termguicolors
syntax on
set t_Co=256
colorscheme onehalflight

" Automatically change the statusline color depending on mode
hi statusbarcolor ctermfg=black ctermbg=white guifg=#fafafa guibg=#383a42
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
exec 'hi CocErrorSign guifg=' . synIDattr(hlID('Keyword'), 'fg')
exec 'hi CocWarningSign guifg=' . synIDattr(hlID('Type'), 'fg')
