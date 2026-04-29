return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = vim.o.columns * 0.4,
			open_mapping = [[<C-/>]], -- Ctrl + / to open the terminal
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
				"<C-/>", -- Ctrl + / to toggle term
				mode = "n", -- Only in normal mode
				desc = "Toggle term",
			},
			{
				"<leader>/", -- Send current line to terminal on <leader>/
				"<cmd>:ToggleTermSendCurrentLine<cr>",
				desc = "Send current line to terminal",
			},
			{
				"<leader>/", -- Send visual selection to terminal on <leader>/
				"<cmd>:ToggleTermSendVisualSelection<cr>",
				desc = "Send visual selection to terminal",
				mode = "v",
			},
		},
	},
}
