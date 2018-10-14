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
let g:deoplete#enable_at_startup = 1

" Elixir Integration Into Vim
Plug 'slashmili/alchemist.vim'

" Add plugins to &runtimepath
call plug#end()

" ==> Vimify
let g:spotify_token='NmExYjA4YjQ5YTc3NGNjOWFiMDgzOWMyYmFkNGQxMmI6YTA4Y2MzMDdjNjg3NDY1ZGI0MGE2MzBmZDI0MWI0ZDM='

" ==> EMMET
" Change emmet shortcut to ctrl+z+,
let g:user_emmet_leader_key='<C-Z>'

" ==> INDENTLINE
" Change indentation char.
let g:indentLine_char = "│"
" Change color of indent lines.
let g:indentLine_color_term = 239

" ==> FZF
set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_COMMAND = 'ag --nocolor -g ""'
nmap ; :FZF<CR>

" ==> GitGutter
" By setting updatetime to 250 we can speed up when git gutter shows
" the sidebar marks.
set updatetime=250
" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '○'
let g:gitgutter_sign_modified = '○'
let g:gitgutter_sign_removed = '○'
let g:gitgutter_sign_modified_removed = '○'
