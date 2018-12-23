" ==> VIM-PLUG
call plug#begin()

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" A vim plugin to display the indention levels with thin vertical lines.
Plug 'Yggdroot/indentLine'
" slim syntax highlighting for vim.
Plug 'onemanstartup/vim-slim'
" Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'
" A collection of syntax definitions not yet shipped with stock vim.
Plug 'justinmk/vim-syntax-extra'
" HTML5 omnicomplete and syntax.
Plug 'othree/html5.vim'
" Vim runtime files for Swift.
Plug 'keith/swift.vim', { 'for': 'swift' }
" Arduino on Vim.
Plug 'jplaut/vim-arduino-ino', { 'for': 'arduino' }
" Vim syntax file for scss (Sassy CSS).
Plug 'cakebaker/scss-syntax.vim'"
" emmet for vim.
Plug 'mattn/emmet-vim'
" Base 16 colorschemes.
Plug 'chriskempson/base16-vim'
" Flake8 Plugin for Vim
Plug 'nvie/vim-flake8'
" Vim configuration files for Elixir
Plug 'elixir-lang/vim-elixir'
" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Spotify integration for vim
Plug 'HendrikPetertje/vimify'

" An arctic, north-bluish clean and elegant Vim theme.
Plug 'arcticicestudio/nord-vim'

" Dark powered asynchronous completion framework for neovim/Vim8
Plug 'Shougo/deoplete.nvim'

" Elixir Integration Into Vim
Plug 'slashmili/alchemist.vim'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" Vim integration for the Elixir formatter.
Plug 'mhinz/vim-mix-format'

" Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration.
Plug 'w0rp/ale'

" Add plugins to &runtimepath
call plug#end()

" ==> Vimify
let g:spotify_token='NmExYjA4YjQ5YTc3NGNjOWFiMDgzOWMyYmFkNGQxMmI6YTA4Y2MzMDdjNjg3NDY1ZGI0MGE2MzBmZDI0MWI0ZDM='


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change emmet shortcut to ctrl+z+,
let g:user_emmet_leader_key='<C-Z>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change indentation char.
let g:indentLine_char = "│"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_COMMAND = 'ag --nocolor -g ""'
nmap ; :FZF<CR>

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 '--color-path "34;1" --color-line-number "32;1"',
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" By setting updatetime to 250 we can speed up when git gutter shows
" the sidebar marks.
set updatetime=250
" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '○'
let g:gitgutter_sign_modified = '○'
let g:gitgutter_sign_removed = '○'
let g:gitgutter_sign_modified_removed = '○'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove top banner.
let g:netrw_banner = 0
" Open new file in a same window that was used to call netrw.
let g:netrw_browse_split = 4
" Set netrw's window size to 25% of the page.
let g:netrw_winsize = 25
" Tree-view.
let g:netrw_liststyle = 3
" Sort by folders first and files last.
let g:netrw_sort_sequence = '[\/]$,*'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore .pyc files.
let NERDTreeIgnore = ['\.pyc$']