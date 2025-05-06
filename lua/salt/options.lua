require("config.lazy")

-- The only leader key that makes sense
vim.g.mapleader = " "

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Split new windows below, and right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Disable line wrapping
vim.opt.wrap = false

-- Use tabs at a length of 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- Setting to 0 defaults to using the tabstop value

-- Syncronizes the system clipboard
-- with Neovim's clipboard
vim.opt.clipboard = "unnamedplus"

-- Centers the cursor in the middle
-- when scrolling in large files
vim.opt.scrolloff = 999

vim.opt.scl = "yes"

-- Make block mode usable
vim.opt.virtualedit = "block"

-- When replacing text, open preview window
vim.opt.inccommand = "split"

-- Allows terminal to use full colors
vim.opt.termguicolors = true
