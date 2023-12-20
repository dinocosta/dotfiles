vim.cmd.colorscheme('rose-pine-dawn')

-- Do not display the tilde (~) character on empty lines.
-- This needs to be called after the `colorscheme` command is called, otherwise it will be overriden.
vim.cmd('hi NonText guifg=bg')
