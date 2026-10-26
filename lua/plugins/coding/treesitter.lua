-- Treesitter: syntax highlighting + parsers.
-- Language packs (lang/*.lua) append their own parsers to `ensure_installed`.
-- Pinned to the `master` branch because the `main` rewrite has a different API.
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	dependencies = {
		-- Was unpinned before, which resolves to `main` and is incompatible with
		-- treesitter `master`. Not configured yet, so it is currently just available.
		{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "master" },
	},
	opts = {
		ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "python", "html", "css", "javascript" },
		auto_install = true, -- install a parser when you open an unknown filetype
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = false },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
