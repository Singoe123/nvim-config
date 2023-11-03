return {
	'VonHeikemen/lsp-zero.nvim',
	dependencies = {
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'williamboman/masason-lspconfig.nvim',
		'hrsj7th/nvim-cmp',
		'hrsj7th/cmp-buffer',
		'hrsj7th/cmp-path',
		'saadparwaiz1/cmp_luasnip',
		'hrsj7th/cmp-nvim-lsp',
		'hrsj7th/cmp-nvim-lua',
		'L3MON4D3/LuaSinp',
		'rafamadriz/friendly-snippets'
	},
	config = function()
		local lsp = require("lsp-zero")
		lsp.preset("recommended")
		lsp.ensure_installed({
			'tsserver',
			'eslint',
			'sumneko_lua',
			'rust_analyzer',
			'clangd',
			'pyright'
		})
	end,
}
