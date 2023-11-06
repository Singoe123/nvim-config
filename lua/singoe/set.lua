--line number options
vim.opt.nu = true
vim.opt.relativenumber = true

--indent options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

--line wrap
vim.opt.wrap = false

--backup and undotree access
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--search option
vim.opt.hlsearch = false
vim.opt.incsearch = true

--color
vim.opt.termguicolors = true

--scroll
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.g.mapleader = " "




