vim.g.mapleader = " "
--explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--move lines
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
--keep cursor position
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
--keep word when repacing
vim.keymap.set("x", "<leader>p", "\"_dP")
--clipboard copy/pasting
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>d", "\"+y")

vim.keymap.set("n", "<leader>pp", "\"+p")
vim.keymap.set("n", "<leader>pp", "\"+p")

vim.keymap.set("n", "<C-a>", "ggVG")
--idk
vim.keymap.set("i", "<C-c>", "<Esc>")
--tmux things
--TODO

