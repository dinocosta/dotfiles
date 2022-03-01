""""""""""""""""""""""""""""""""""""""""
" Contains all the mappings for neovim "
""""""""""""""""""""""""""""""""""""""""

" Close and open folds using LEADER+,.
nnoremap <leader>, za

" Cycle through selections using TAB.
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><S-Tab> pumvisible() ? "\<c-p>" : "\<tab>"

" turn off words highlighted with search by using <leader><space>
nnoremap <leader><space> :nohlsearch<CR>

" Easier navigation in panes by Ctrl-W and Ctrl-<Direction-Key>
" where the <Direction-Key> are vim's direction keys (h j k l)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Save file using Leader+w.
nnoremap <Leader>w :w<CR>

" Quit vim using Leader+q.
nnoremap <Leader>q :q<CR>

""""""""""""""""""""""""""""""
" BUFFERS
""""""""""""""""""""""""""""""

" List all possible buffers with "gl"
nnoremap gl :call fzf#vim#buffers({'options': '--layout=reverse', 'window': 'call CreateCenteredFloatingWindow()'})<CR>

" Close current buffer with Leader+d.
nmap <Leader>d :bd<CR>

" Close quickfix window with Leader+x.
map <Leader>x :cclose<CR>

" Toggle fugitive window with Leader+g.
nnoremap <Leader>g :G<CR>

" Open FZF with Ctrl-P or Leader+;.
"
" Here's the explanations for the extra commands:
" * --prompt ""  -> makes FZF prompt be equal to an empty string
" * --layout=reverse -> reverses the layout so that the prompt is at the top
"   of the window instead of the bottom.
" * 'window': 'call CreateCenteredFloatingWindow()' -> Calls the provided
"   function in order to create the FZF window.
nmap <silent> <C-P> :call fzf#vim#files('.', {'options': '--prompt "" --layout=reverse', 'window': 'call CreateCenteredFloatingWindow()'})<CR>
nmap <silent> <Leader>; :call fzf#vim#files('.', {'options': '--prompt "" --layout=reverse', 'window': 'call CreateCenteredFloatingWindow()'})<CR>

" Jump to definition with Ctrl+]
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
