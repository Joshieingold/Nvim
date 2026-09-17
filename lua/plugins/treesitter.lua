return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"html",
				"python",
				"javascript",
				"razor",
			},

			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			autotag = {
				enable = true,
			},

			indent = {
				enable = true,
			},
		},

		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)

			vim.treesitter.language.register("razor", "razor")
		end,
	},
}
