require('nvim-tree').setup({
    renderer = {
        -- Enable indentation markers as folders are opened.
        indent_markers = {
            enable = true,
        },
        icons = {
            show = {
                -- Disable webdev icons for files.
                file = false,
            },
        }
    }
})

-- Toggle NvimTree with Ctrl + N.
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<cr>')
