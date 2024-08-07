return {
	'VonHeikemen/lsp-zero.nvim',
	dependencies = {
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lua',
		'L3MON4D3/LuaSnip',
		'rafamadriz/friendly-snippets'
	},
	config = function()
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
			local opts = {buffer = bufnr, remap = false}

			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
			vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
			vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
			vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
			vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
			vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
			vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
			vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
			vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		end)

		require('mason').setup({})
		require('mason-lspconfig').setup({
			ensure_installed = {'clangd', 'pyright', 'lua_ls', 'tsserver', 'rust_analyzer'},
			handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
					local lua_opts = lsp_zero.nvim_lua_ls()
					require('lspconfig').lua_ls.setup(lua_opts)
				end,
                clangd = function()
                    require('lspconfig').clangd.setup({
                        cmd = { "clangd", "--log=verbose" },
                        on_attach = function(client, bufnr)
                            lsp_zero.on_attach(client, bufnr)
                        end,
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),
                        settings = {
                            clangd = {
                            }
                        }
                    })
                end,
			}
		})

		local cmp = require('cmp')
		local cmp_select = {behavior = cmp.SelectBehavior.Select}

		cmp.setup({
			sources = {
				{name = 'path'},
				{name = 'nvim_lsp'},
				{name = 'nvim_lua'},
			},
			formatting = lsp_zero.cmp_format(),
			mapping = cmp.mapping.preset.insert({
				['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
				['<Tab>'] = cmp.mapping.confirm({ select = true }),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				['<C-Space>'] = cmp.mapping.complete(),
			}),
		})

        -- Disable virtual text and signs for hints and warnings, keep errors
        vim.diagnostic.config({
            virtual_text = {
                severity = {
                    min = vim.diagnostic.severity.ERROR,
                },
            },
            signs = {
                severity = {
                    min = vim.diagnostic.severity.ERROR,
                },
            },
            underline = {
                severity = {
                    min = vim.diagnostic.severity.ERROR,
                },
            },
            update_in_insert = false,
            severity_sort = true,
        })
	end,
}
