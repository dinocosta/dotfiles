-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ 
		'rose-pine/neovim', name = 'rose-pine'
	},
	{
		'nvim-treesitter/nvim-treesitter'
	},
	{
		'tpope/vim-fugitive'
	},
	{
		'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
		dependencies = {
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/nvim-cmp'},
			{'L3MON4D3/LuaSnip'},
		}
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			{'williamboman/mason.nvim'}
		}
	},
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {'nvim-tree/nvim-web-devicons'}
    },
    {
        'nvim-lualine/lualine.nvim'
    },
    {
        'L3M0N4D3/LuaSnip',
        dependencies = { 
            'rafamadriz/friendly-snippets',
            'honza/vim-snippets'
        }
    },
    {
        -- A vim plugin to display the indention levels with thin vertical lines.
        'Yggdroot/indentLine'
    }
}

require("lazy").setup(plugins)
