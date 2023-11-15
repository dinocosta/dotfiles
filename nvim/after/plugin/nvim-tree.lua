require('nvim-tree').setup({
    renderer = {
        icons = {
            show = {
                file = false,
                folder = false,
            },
            glyphs = {
                folder = {
                    arrow_closed = "❯",
                    arrow_open = "▼"
                }
            }
        }
    }
})

-- Toggle NvimTree with Ctrl + N.
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<cr>')
