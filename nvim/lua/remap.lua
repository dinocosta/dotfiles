-- Write buffer with <leader> + w.
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")

-- Quit with <leader> + q.
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")

-- Delete buffer with <leader> + d.
vim.keymap.set("n", "<leader>d", "<cmd>bdelete<cr>")

-- Move selected lines in Visual mode with J and K.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle of the screen when moving around the buffer with
-- <C-d> and <C-u> (page down and page up).
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When searching, keep cursor in the middle of the screen when moving between
-- matches.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Quickfix navigation.
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Remove search higlight with space space.
vim.keymap.set("n", "<leader><leader>", "<cmd>nohlsearch<CR>")
