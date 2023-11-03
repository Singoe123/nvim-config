return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")

	telescope.setup({
		defaults = {
			path_display = { "truncate " },
			mappings = {
				i = {
					["<C-k>"] = actions.move_selection_previous, -- move to prev result
					["<C-j>"] = actions.move_selection_next, -- move to next result
					["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				},
			},
		},
	})


	-- set keymaps
	local builtin = require("telescope.builtin")
	vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
	vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
	vim.keymap.set('n', '<leader>ps', function() builtin.grep_string({search = vim.fn.input("Grep > ")}) end)
	vim.keymap.set('n', '<leader>cs', builtin.grep_string, {})
	end,
}
