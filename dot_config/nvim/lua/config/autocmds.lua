-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
-- vim.api.nvim_create_autocmd("ExitPre", {
-- 	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
-- 	command = "set guicursor=a:ver90",
-- 	desc = "Set cursor back to beam when leaving Neovim.",
-- })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		vim.keymap.set("n", "<leader>cR", function()
			local file = vim.fn.expand("%:p")

			-- open terminal in split
			vim.cmd('split | terminal fish -c "cpp-run ' .. file .. '"')

			-- configure terminal buffer
			local buf = vim.api.nvim_get_current_buf()
			vim.bo[buf].buflisted = false
			vim.bo[buf].bufhidden = "wipe"

			-- close + wipe with 'q'
			vim.keymap.set("n", "q", "<cmd>bd!<cr>", { buffer = buf, silent = true })

			-- from terminal-mode: Esc Esc closes it
			vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n><cmd>bd!<cr>", { buffer = buf, silent = true })
		end, { buffer = true, silent = true, desc = "C++ compile and run" })
	end,
})

-- Give input.txt/output.txt a special filetype so edgy can detect them
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "input.txt", "output.txt" },
	callback = function(args)
		vim.bo[args.buf].filetype = "cp-io"
	end,
})

-- your CPLayout command
vim.api.nvim_create_user_command("CPLayout", function()
	vim.cmd("edit main.cpp")
	vim.cmd("vsplit input.txt")
	vim.cmd("wincmd l")
	vim.cmd("split output.txt")
	vim.cmd("wincmd h")
end, {})
