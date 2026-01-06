return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Automatically runs :TSUpdate after installation/update
	branch = "master",
	opts = {
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"html",
			"python", -- Add other languages you use here
		},
		auto_install = true,
		highlight = {
			enable = true, -- Enable syntax highlighting
			additional_vim_regex_highlighting = false,
		},
		autotag = { enable = true },
		indent = {
			enable = true, -- Enable indentation
		},
	},
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" }, -- Optional: for improved text objects (e.g., vafo, vafc)
	},
}
