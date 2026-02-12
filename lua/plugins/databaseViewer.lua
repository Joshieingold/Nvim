return {
	{ "tpope/vim-dadbod" },

	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = { "tpope/vim-dadbod" },
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection" },
		keys = {
			{
				"<leader>q",
				"<cmd>DBUIToggle<CR>",
				mode = "n",
				desc = "Toggle DB UI",
			},
		},
	},

	{
		"kristijanhusak/vim-dadbod-completion",
		ft = { "sql", "mysql", "plsql" },
		dependencies = { "tpope/vim-dadbod" },
	},
}
