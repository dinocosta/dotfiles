let mapleader=","

set nocompatible    " vim not vi

let g:AutoPairsFlyMode = 1

source $HOME/.dotfiles/nvim/plugins.vim
source $HOME/.dotfiles/nvim/mappings.vim

" ---------------------------------------------------------------------------------------
" VIM CONFIGURATION
" ---------------------------------------------------------------------------------------

" Folding
set foldenable
set foldlevelstart=7
set foldnestmax=10
set foldmethod=indent

" ctags
set tags=tags;

" disable showmode so '--INSERT--' is not shown
set noshowmode

syntax on
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on    " required for Vundler

set encoding=utf-8      " Use UTF-8 By Default
scriptencoding utf-8

set t_Co=256
colorscheme onehalflight
set background=light
highlight Pmenu ctermbg=white ctermfg=black
highlight PmenuSel ctermbg=blue ctermfg=white
" " Needed to match the terminal's background
" highlight Normal ctermbg=0 ctermfg=253

" -- Highlights.

" -- highlights current line
set cursorline
"highlight CursorLine cterm=underline ctermbg=black

" -- Matched words colors.
"highlight Search cterm=None ctermfg=black ctermbg=white

" highlight LineNr ctermfg=254
highlight MatchParen cterm=none ctermfg=white
highlight Comment cterm=italic
"
"

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
set backspace=indent,eol,start

set expandtab
set smarttab
set autoindent

" briefly jump to matching parenthesis
set showmatch

set wrap
set linebreak

set relativenumber
" set number

set ttyfast

" Using mouse and scroll
set mouse=a

set switchbuf+=newtab

set shell=zsh

" change number of lines between cursor and scroll
set scrolloff=3

" no backups after overwritting
set nobackup

" setting menu for command line completion and command status
set showcmd
set wildmenu

" autoread file when changed outside vim
set autoread

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
au FileType crontab setlocal bkc=yes

" yank to clipboard
if has ("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has ("unnamedplus") " X11 Support
    set clipboard+=unnamedplus
  endif
endif

" Reduce delay in Esc mode switching
set ttimeoutlen=50

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

set timeoutlen=300

" Open diffs with vertical splits
set diffopt+=vertical

" Statusline

let g:currentmode={
      \ 'n'  : 'N ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'V ',
      \ 'V'  : 'V·Line ',
      \ '' : 'V·Block ',
      \ 's'  : 'Select ',
      \ 'S'  : 'S·Line ',
      \ '^S' : 'S·Block ',
      \ 'i'  : 'I ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \ 't'  : 'Terminal '
      \}

" Automatically change the statusline color depending on mode
" Automatically change the statusline color depending on mode
""function! ChangeStatuslineColor()
""  if (mode() =~# '\v(n|no)')
""    exe 'hi! StatusLine ctermfg=010'
""    exe 'hi! StatusLine ctermbg=000'
""  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
""    exe 'hi! StatusLine ctermfg=005'
""    exe 'hi! StatusLine ctermbg=010'
""  elseif (mode() ==# 'i')
""    exe 'hi! StatusLine ctermfg=004'
""  else
""    exe 'hi! StatusLine ctermfg=006'
""  endif
""
""  return ''
""endfunction

" Check if file is read only.
function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

"highlight statusbarcolor ctermfg=white ctermbg=black
"set laststatus=2
"set statusline=
"set statusline+=%{ChangeStatuslineColor()}                  " Changing the statusline color
"set statusline+=%0*\ %{toupper(g:currentmode[mode()])}      " Current mode
"set statusline+=%8*%#statusbarcolor#\ %<%F\ %{ReadOnly()}\ %m\ %w\           " File+path
"set statusline+=%9*%#statusbarcolor#\ %=                                     " Space
"set statusline+=%8*%#statusbarcolor#\ %y\                                    " FileType
"set statusline+=%7*%#statusbarcolor#\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\    " Encoding & Fileformat
"set statusline+=%0*\ %3p%%\ \ %l/%L:\ %3c\                 " Rownumber/total (%)

" Tab bar
"
" TabLineSel - is the current (so to say) active tab label.
" TabLine - are the labels which are not currently active.
" TabLineFill - is the remaining of the tabline where there is no labels (background).
hi TabLineSel ctermbg=0 ctermfg=10
hi TabLine ctermfg=255 ctermbg=0
hi TabLineFill ctermfg=255

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
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
syn match pythonSelf "\(\W\|^\)\@<=self"
highlight pythonSelf ctermfg=167

" colorscheme
source $HOME/.dotfiles/nvim/onehalflight.vim
