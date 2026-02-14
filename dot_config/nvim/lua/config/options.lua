-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for
opt.clipboard = "unnamedplus"
opt.autoindent = true
opt.smartindent = true
opt.fileencoding = "utf-8"
opt.ignorecase = true -- ignore case while searching
opt.smartcase = true -- ovveride ignore case if search pattern contains upper case characters

vim.g.lazyvim_picker = "fzf"
