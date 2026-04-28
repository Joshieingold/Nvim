return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = vim.o.columns * 0.4,
			open_mapping = [[<leader>t]],
			dir = "git_dir",
			hide_numbers = false,
			shade_terminals = true,
			shading_factor = 1,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			close_on_exit = true,
			shell = vim.o.shell,
			direction = "vertical",
		},
		keys = {
			{
				"<leader>t",
				mode = "n",
				desc = "Toggle term",
			},
			{
				"<leader>.",
				"<cmd>:ToggleTermSendCurrentLine<cr>",
				desc = "Send current line to terminal",
			},
			{
				"<leader>t",
				"<cmd>:ToggleTermSendVisualSelection<cr>",
				desc = "Send visual selection to terminal",
				mode = "v",
			},
		},
	},
}
