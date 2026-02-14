return {
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			local servers = require("plugins.lsp.servers")
			local server_names = {}
			for server, _ in pairs(servers) do
				table.insert(server_names, server)
			end

			require("mason-lspconfig").setup({
				ensure_installed = server_names,
			})

			-- Setup handlers - automatically configure LSP servers
			require("plugins.lsp.config")
		end,
	},
}
