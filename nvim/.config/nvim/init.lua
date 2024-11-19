-- bootstrap lazy.nvim, LazyVim and your plugins

local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")
Plug("MunifTanjim/nui.nvim")
Plug("nvim-tree/nvim-web-devicons")
vim.call("plug#end")
require("config.lazy")
require("oil").setup()
