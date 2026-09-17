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

			indent = {
				enable = false,
			},
		},

		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)

			vim.treesitter.language.register("razor", "razor")
			vim.treesitter.language.register("html", "cshtml")
		end,
	},
}
