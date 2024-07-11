return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "undotree",
			callback = function()
				vim.cmd("setlocal winhighlight=Normal:Normal")
			end,
		})
	end,
}
