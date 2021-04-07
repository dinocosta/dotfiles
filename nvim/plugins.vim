" ==> VIM-PLUG
call plug#begin()

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" A vim plugin to display the indention levels with thin vertical lines.
Plug 'Yggdroot/indentLine'

" Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'

" Base 16 colorschemes.
Plug 'chriskempson/base16-vim'

" A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
Plug 'joshdick/onedark.vim'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode.
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Vim configuration files for Elixir
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }

" Vim integration for the Elixir formatter.
Plug 'joaofcosta/vim-mix-format', { 'for': 'elixir' }

"File manager for Neovim. Better than NERDTree.
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" UltiSnips - The ultimate snippet solution for Vim.
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" 🌷 Distraction-free writing in Vim
Plug 'junegunn/goyo.vim', { 'for': ['markdown'] }

" 🔦 All the world's indeed a stage and we are merely players.
Plug 'junegunn/limelight.vim', { 'for': ['markdown'] }

" Markdown plugins.
Plug 'godlygeek/tabular', { 'for': ['markdown'] }
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': ['markdown'] }

" Open selected text in https://carbon.now.sh.
Plug 'kristijanhusak/vim-carbon-now-sh'

" unimpaired.vim: Pairs of handy bracket mappings.
Plug 'tpope/vim-unimpaired'

" Functions for taking the monotony out of building your own fancy statusline in Vim
Plug 'rbong/vim-crystalline'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" A Vim plugin that manages your tag files
Plug 'ludovicchabant/vim-gutentags'

Plug 'morhetz/gruvbox'

Plug 'tpope/vim-projectionist'

" Add plugins to runtimepath
call plug#end()

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
let $FZF_DEFAULT_OPTS=' --pointer="▶" --no-info --margin=1,3'

" Hide FZF preview window.
let g:fzf_preview_window = ''

" Removes the bar at the bottom that says fzf while fzf is running.
autocmd! FileType fzf

" Disables the indent lines plugin in the FZF window.
autocmd FileType fzf :IndentLinesDisable

" Disables relativenumbers in FZF windows and other shenanigans.
autocmd FileType fzf set laststatus=0 noshowmode noruler norelativenumber | autocmd BufLeave <buffer> set laststatus=2 showmode ruler

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
let g:gitgutter_sign_added = '●'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_removed = '●'
let g:gitgutter_sign_modified_removed = '●'

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
" CHADTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:chadtree_settings = { 'theme.icon_glyph_set': 'ascii' }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UtilSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" crystalline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:crystalline_separators=['', '']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown-preview.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mkdp_refresh_slow=1
autocmd FileType markdown set conceallevel=0
