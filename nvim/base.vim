" allow unsaved background buffers.
set hidden
syntax on
filetype on
filetype plugin on
filetype indent on

" Set leader key to SPACE.
let mapleader=" "

" Disable showmode so '--INSERT--' is not shown.
set noshowmode

" Horizontal split to the bottom
set splitbelow

" Vertical split to the right
set splitright

" Tabs.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=indent,eol,start

" Set shell to run commands as ZSH.
set shell=zsh

" Python 2 and 3 locations.
let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Remove trailing whitespaces
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Highlight all matched search terms.
set hlsearch

" ignores case when searching except when pattern is all uppercase
set ignorecase smartcase

" Match words as you are typing the search term.
set incsearch

" Insert spaces when tab is pressed.
set expandtab

" Indents according to current line when inserting a new line.
set autoindent

" Wrap text if the line is bigger than terminal window.
set wrap

" Show numbers relative to the current line.
set relativenumber

" Show line number.
set number

" Create folds by indentation level.
set foldmethod=indent

" Open all folds when opening a new buffer.
set foldlevelstart=20

" Enable mouse use on all modes.
set mouse=a

" No backups after overwritting.
set nobackup

" Better command-line completion.
set wildmenu

" Show last run command on last line of terminal window.
set showcmd

" autoread file when changed outside vim
set autoread

" reduce time to wait for a mapped sequence to complete.
set timeoutlen=300

" Open diffs with vertical splits.
set diffopt+=vertical

" copy to the system clipboard.
set clipboard=unnamed " copy to the system clipboard

" Highlight current line.
set cursorline

" Highlight whitespaces.
set list
set listchars=
set listchars+=trail:⋅
set listchars+=eol:¬
set listchars+=tab:▸\
set listchars+=extends:→
set listchars+=precedes:←
set listchars+=nbsp:⣿

" Persistent Undo.
" Make sure you have the folder ~/.vim/undodir because
" that's where the undo files will be created.
set undofile
set undodir=~/.vim/undodir

" Spelling.
set spell spelllang=en_us
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>f 1z=

set noshowcmd
set noruler
