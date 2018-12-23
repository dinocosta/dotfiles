" allow unsaved background buffers.
set hidden
syntax on
filetype on
filetype plugin on
filetype indent on

" Set leader key to ",".
let mapleader=","

" Folding.
set foldenable
set foldlevelstart=7
set foldnestmax=10
set foldmethod=indent

" Exuberant CTags.
set tags=tags;

" Disable showmode so '--INSERT--' is not shown.
set noshowmode

" Highlights current line.
set cursorline

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
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Remove trailing whitespaces
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Spell checking and automaatic wrapping at 72 columns for commits.
autocmd Filetype gitcommit setlocal spell textwidth=72

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

" Show current line number.
set number

" Enable mouse use on all modes.
set mouse=a

" Number of lines to keep above and below the cursor when scrolling.
set scrolloff=5

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

" yank to clipboard
if has ("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has ("unnamedplus") " X11 Support
    set clipboard+=unnamedplus
  endif
endif

" Highlight whitespaces.
set list
set listchars=
set listchars+=trail:⋅
set listchars+=eol:¬
set listchars+=tab:▸\
set listchars+=extends:→
set listchars+=precedes:←
set listchars+=nbsp:⣿
