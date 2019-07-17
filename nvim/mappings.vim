" Close and open folds using space.
nnoremap <space> za

" Cycle through selections using TAB.
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><S-Tab> pumvisible() ? "\<c-p>" : "\<tab>"

" turn off words highlighted with search by using <leader><space>
nnoremap <leader><space> :nohlsearch<CR>
" Convert lines of strings into a Python list of strings.
nnoremap <leader>q :%s/^/"<CR>:%s/$/",<CR>:1,$join<CR>:%s/^/[<CR>:%s/,$/]<CR>

" Easier navigation in panes by Ctrl-W and Ctrl-<Direction-Key>
" where the <Direction-Key> are vim's direction keys (h j k l)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Yanking between vim sessions
vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/.vim/.reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/.vim/.reg.txt<CR>
map <silent> ,p :sview ~/.vim/.reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/.vim/.reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Old EasyMotion keybinding
map <Leader> <Plug>(easymotion-prefix)

" Save file using Leader+w.
nnoremap <Leader>w :w<CR>

" Quit vim using Leader+q.
nnoremap <Leader>q :q<CR>

" Buffers
"
" Move to the previous buffer with "gp"
nnoremap gp :bp<CR>
" Move to the next buffer with "gn"
nnoremap gn :bn<CR>
" List all possible buffers with "gl"
nnoremap gl :Buffers<CR>
" List all possible buffers with "gb" and accept a new buffer argument [1]
nnoremap gb :ls<CR>:b

" Toggle L with Ctrl-E
function! ToggleLExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Lexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleLExplorer()<CR>
map <silent> <C-N> :NERDTreeToggle<CR>
