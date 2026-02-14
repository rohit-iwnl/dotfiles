return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	opts = {
		-- main code window stays as a normal split
		right = {
			{
				title = "CP IO",
				-- we’ll route input/output buffers here
				ft = "cp-io",
				-- double-check we only catch input.txt / output.txt
				filter = function(buf, win)
					local name = vim.api.nvim_buf_get_name(buf)
					name = name:match("[^/\\]+$") or name
					return name == "input.txt" or name == "output.txt"
				end,
				size = { width = 40 }, -- width of the IO column
				pinned = true,
			},
		},

		-- you can keep other defaults or omit them
		animate = { enabled = true },
	},
}
