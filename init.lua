require("singoe")

--set colorscheme
vim.cmd [[colorscheme catppuccin-mocha]]

-- Set global transparency for various highlight groups
local transparent_groups = {
    "Normal",
    "NormalNC", -- Non-current windows
    "NormalFloat",
    "FloatBorder",
    "TelescopeNormal",
    "TelescopeBorder",
    "VertSplit",
    "SignColumn",
    "EndOfBuffer",
    "StatusLine",
    "StatusLineNC",
}

for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, {bg = "none"})
end

-- Apply transparency to all windows
vim.api.nvim_create_autocmd({"VimEnter", "WinEnter", "BufWinEnter"}, {
    callback = function()
        for _, group in ipairs(transparent_groups) do
            vim.api.nvim_set_hl(0, group, {bg = "none"})
        end
    end,
})

local is_wsl = vim.fn.has("wsl") == 1

if is_wsl then
    vim.g.clipboard = {
        name = "wslclip",
        copy = {
            ["+"] = "powershell.exe win32yank.exe -i --crlf",
            ["*"] = "powershell.exe win32yank.exe -i --crlf",
        },
        paste = {
            ["+"] = "powershell.exe win32yank.exe -o --lf",
            ["*"] = "powershell.exe win32yank.exe -o --lf",
        },
        cache_enabled = 0,
    }
end
