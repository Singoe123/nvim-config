return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "python", "bash", "cpp", "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			additional_vim_regex_highlighting = false,
		})
	end,
}
