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
        },
        -- Show only the current folder name as the root.
        root_folder_label = ":t:r"
    }
})

-- Toggle NvimTree with Ctrl + N.
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<cr>')
