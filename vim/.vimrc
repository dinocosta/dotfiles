let mapleader=","

set nocompatible    " vim not vi
filetype off        " required for Vundle

let g:AutoPairsFlyMode = 1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'chriskempson/base16-vim'
" Language specific
Plugin 'onemanstartup/vim-slim'
Plugin 'https://github.com/Raimondi/delimitMate.git'
Plugin 'https://github.com/justinmk/vim-syntax-extra.git'
Plugin 'othree/html5.vim'
Plugin 'keith/swift.vim'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'cakebaker/scss-syntax.vim'"
Plugin 'mattn/emmet-vim'"
Bundle 'vim-ruby/vim-ruby'

" ==> PLUGIN CONFIGURATION.

" EMMET
" " Change emmet shortcut to ctrl+z+,
let g:user_emmet_leader_key='<C-Z>'

" INDENTLINE
" " Change indentation char.
let g:indentLine_char = "│"
" " Change color of indent lines.
let g:indentLine_color_term = 240

" ==> VIM CONFIGURATION

" Folding
set foldenable
set foldlevelstart=3
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Disable arrow keys
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>


call vundle#end()            " required for Vundler
syntax on
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on    " required for Vundler

set encoding=utf-8
scriptencoding utf-8


" set t_Co=256
" ---> Change colorscheme according to iTerm profile.
if $ITERM_PROFILE == 'Night'
  colorscheme Tomorrow-Night
else
  colorscheme base16-default-light
endif

" ---> Change background according to iTerm profile.
if $ITERM_PROFILE == 'Dark'
  set background=dark
endif

if $ITERM_PROFILE == 'Default'
  set background=light
endif

" highlights
" highlights current line
set cursorline
" highlight CursorLine term=bold ctermbg=black
" highlight LineNr ctermfg=254
highlight MatchParen cterm=none ctermfg=white
" highlight Comment cterm=italic

" ignore javadoc for better comment coloring.
let java_ignore_javadoc=1

" allow unsaved background buffers
set hidden

" Horizontal split to the bottom
set splitbelow

" Vertical split to the right
set splitright

set hlsearch
set incsearch
" ignores case when searching except when pattern is all uppercase
set ignorecase smartcase

set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=1

set expandtab
set smarttab
set autoindent

" briefly jump to matching parenthesis
set showmatch

set wrap
set linebreak

set relativenumber
" set number

" set vertical line at 100 characters
set colorcolumn=100

set ttyfast

" Using mouse and scroll
set mouse=a

set switchbuf=useopen

set shell=zsh

" change number of lines between cursor and scroll
set scrolloff=3

" no backups after overwritting
set nobackup

" backspacing to the start of line
set backspace=indent,eol,start

" setting menu for command line completion and command status
set showcmd
set wildmenu

" autoread file when changed outside vim
set autoread

" Arrow navigation
"imap <silent> <Down> <C-o>gj
"imap <silent> <Up> <C-o>gk
"nmap <silent> <Down> gj
"nmap <silent> <Up> gk
" Be a man!

" Cycling through buffers
exe "set <M-b>=\<Esc>b"
exe "set <M-n>=\<Esc>n"
nmap <M-b> :bprevious<CR>
nmap <M-n> :bnext<CR>

" Remove trailing whitespaces
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Speel checking and automaatic wrapping at 72 columns for commits.
autocmd Filetype gitcommit setlocal spell textwidth=72

" Associate *.prolog and *.gawk with prolog and awk filetypes
au BufRead,BufNewFile *.prolog setfiletype prolog
au BufRead,BufNewFile *.gawk setfiletype awk
" Associat *.pde and *.ino with arduino filetypes
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" Yanking between vim sessions
vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/.vim/.reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/.vim/.reg.txt<CR>
map <silent> ,p :sview ~/.vim/.reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/.vim/.reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

" yank to clipboard
if has ("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has ("unnamedplus") " X11 Support
    set clipboard+=unnamedplus
  endif
endif

" Fuzzy search by filename
let g:ctrlp_by_filename = 1

" Reduce delay in Esc mode switching
set ttimeoutlen=50

" Old EasyMotion keybinding
map <Leader> <Plug>(easymotion-prefix)

" Lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

"augroup AutoSyntastic
"  autocmd!
"  autocmd BufWritePost *.c,*.cpp call s:syntastic()
"augroup END
"function! s:syntastic()
"  SyntasticCheck
"  call lightline#update()
"endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" Map Caps Lock to Esc
imap jj <Esc>
set timeoutlen=300

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
