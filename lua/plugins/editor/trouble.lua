-- Trouble: nicer lists for diagnostics, quickfix, location list and TODOs.
return {
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
		opts = { focus = true },
		keys = {
			{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Trouble: workspace diagnostics" },
			{ "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Trouble: buffer diagnostics" },
			{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Trouble: quickfix" },
			{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Trouble: location list" },
			{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Trouble: TODO comments" },
		},
	},
	{
		-- Needed by `Trouble todo`. Previously it was only listed as a dependency
		-- and never set up; this also highlights TODO/FIXME/NOTE in comments.
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
