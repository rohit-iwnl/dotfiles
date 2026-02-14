-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Disable command-line window for normal and visual modes
vim.keymap.set({ "n", "v" }, "q:", "<nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "q/", "<nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "q?", "<nop>", { silent = true })

--------------------------
-- Split Navigation
--------------------------
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

--------------------------
-- Smart Split Directions
--------------------------
vim.o.splitright = true -- Vertical splits open to the right
vim.o.splitbelow = true -- Horizontal splits open below

--------------------------
-- Resize Splits (Ctrl + Arrows)
--------------------------
vim.keymap.set("n", "<C-Left>", ":vertical resize -3<CR>", { desc = "Resize split left" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +3<CR>", { desc = "Resize split right" })
vim.keymap.set("n", "<C-Up>", ":resize -3<CR>", { desc = "Resize split up" })
vim.keymap.set("n", "<C-Down>", ":resize +3<CR>", { desc = "Resize split down" })

-- Visually select lines, and move them up/down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move one line up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move one line down" })

vim.keymap.set("n", "gob", "]}", { desc = "Go to end of current block" })

-- Go to beginning of current block (alias for [{)
vim.keymap.set("n", "gtb", "[{", { desc = "Go to beginning of current block" })
--------------------------
-- Maximize / Restore Split (tmux style)
--------------------------
local maximize_toggle = false
vim.keymap.set("n", "<leader>m", function()
	if maximize_toggle then
		vim.cmd("wincmd =")
		maximize_toggle = false
	else
		vim.cmd("wincmd |")
		vim.cmd("wincmd _")
		maximize_toggle = true
	end
end)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Open compiler
map("n", "<leader>co", "<cmd>CompilerOpen<cr>", opts)

-- Redo last selected option (compile / run)
map("n", "<leader>cr", "<cmd>CompilerRedo<cr>", opts)

-- Stop all tasks, then redo (clean rebuild / rerun)
map("n", "<leader>cR", "<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>", opts)

-- Toggle compiler results
map("n", "<leader>ct", "<cmd>CompilerToggleResults<cr>", opts)

-- keymap: <leader>cp to trigger CPLayout
map("n", "<leader>cp", "<cmd>CPLayout<cr>", { desc = "Set up comp layout" })
