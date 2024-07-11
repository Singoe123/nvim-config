return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_filetypes = {
            javascript = true,
            typescript = true,
            python = true,
            lua = true,
        }
    end,
}
