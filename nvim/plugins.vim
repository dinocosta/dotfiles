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

" A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'

Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Vim configuration files for Elixir
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }

" Vim integration for the Elixir formatter.
Plug 'joaofcosta/vim-mix-format', { 'for': 'elixir' }

" UltiSnips - The ultimate snippet solution for Vim.
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

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

Plug 'neovim/nvim-lspconfig'

" A file explorer tree for neovim written in lua.
Plug 'kyazdani42/nvim-tree.lua'

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim-tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ? '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '?',
    \ 'symlink': '?',
    \ 'git': {
    \   'unstaged': "?",
    \   'staged': "?",
    \   'unmerged': "?",
    \   'renamed': "?",
    \   'untracked': "?",
    \   'deleted': "?",
    \   'ignored': "?"
    \   },
    \ 'folder': {
    \   'arrow_open': "?",
    \   'arrow_closed': "?",
    \   'default': "?",
    \   'open': "?",
    \   'empty': "?",
    \   'empty_open': "?",
    \   'symlink': "?",
    \   'symlink_open': "?",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lsp-config.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
local opts = { noremap=true, silent=true }
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

require'lspconfig'.elixirls.setup{
  cmd = { "/Users/dino/Developer/elixir-ls/release/language_server.sh" };
  on_attach = on_attach
}

require'nvim-tree'.setup()
EOF
