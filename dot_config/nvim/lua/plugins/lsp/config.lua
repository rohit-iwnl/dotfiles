local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = require("plugins.lsp.servers")

-- Set tabstop for TypeScript/JavaScript files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.expandtab = true
	end,
})

require("mason-lspconfig").setup_handlers({
	-- Default handler for all servers
	function(server_name)
		local opts = servers[server_name] or {}
		opts.capabilities = capabilities
		require("lspconfig")[server_name].setup(opts)
	end,
})
