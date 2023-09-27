local opt = vim.opt

vim.g.mapleader = " "

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"

-- Indenting
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse ="a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.ruler = false

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

opt.scrolloff = 8
opt.timeoutlen = 400
opt.updatetime = 250

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"
