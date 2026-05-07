return {
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				prompt_prefix = "   ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				path_display = { "truncate" },
			},
		},
		keys = {
			{
				"<leader>pf",
				"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
				desc = "Find All Files (including hidden)",
			},
		},
	},
}
