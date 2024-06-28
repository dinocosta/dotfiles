require('lualine').setup({
    theme = 'ayu_light',
    sections = {
        lualine_b = {'diff', 'diagnostics'},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'filetype'},
    },
    disabled_filetypes = {'NvimTree'}
})
