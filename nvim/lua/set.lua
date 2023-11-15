-- Disable netrw as we are going to use NvimTree.
vim.g.loaded_netrw          = 1
vim.g.loaded_netrwPlugin    = 1

-- Enable line numbers and relative line numbers.
vim.opt.nu  = true
vim.opt.rnu = true

-- Use 4 spaces for indenting.
-- Setting vim.opt.expandtab to true makes sure whenever I press tab I get spaces instead.
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true

-- Enable smart indenting, for more information do :h smartindent.
vim.opt.smartindent = true

-- Disable line wrapping.
vim.opt.wrap = false

-- Set up an undo file to preserve undo history between sessions.
vim.opt.swapfile    = false
vim.opt.backup      = false
vim.opt.undodir     = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile    = true

-- Disabling vim.opt.hlsearch makes sure only the current match is highlighted,
-- instead of all the matches.
-- Enabling vim.opt.incrsearch higlights the word as you're typing the search term.
vim.opt.hlsearch    = false
vim.opt.incsearch   = true

-- Enable Terminal's GUI colors.
vim.opt.termguicolors = true

-- Set mapleader to Space key.
vim.g.mapleader = " "

-- Use system clipboard.
vim.opt.clipboard = 'unnamedplus'
