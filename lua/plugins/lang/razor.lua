-- Razor / Blazor / .cshtml support (+ plain C#).
--
-- How it works: roslyn.nvim now handles Razor itself ("co-hosting"), so the old
-- rzls.nvim is NOT needed. The `roslyn` server package ships in a community Mason
-- registry that must be added to Mason (first block below).
--
-- Where the rest of the Razor setup lives:
--   lua/config/filetypes.lua      .razor and .cshtml -> filetype "razor"
--   lsp/roslyn.lua                server settings
--   lsp/html.lua, lsp/cssls.lua   extra HTML/CSS completion in markup (optional)
--   lsp/emmet_ls.lua              Emmet abbreviations in markup (optional)
--   lua/plugins/coding/completion.lua   snippet collections for razor
--   after/ftplugin/razor.lua      commentstring etc.
return {
	-- 1. Mason: add the registry that provides `roslyn` (the default registry
	--    must be listed too, since setting `registries` replaces the default).
	{
		"williamboman/mason.nvim",
		opts = {
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		},
	},

	-- 2. Auto-install the language server + formatter
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "roslyn", "csharpier" })
		end,
	},

	-- 3. The LSP client plugin. Configure the *server* in lsp/roslyn.lua,
	--    plugin behaviour (multi-solution handling etc.) here.
	--    Commands: :Roslyn restart | start | stop | target
	{
		"seblyng/roslyn.nvim",
		opts = {},
	},

	-- 4. Vim-script syntax + indent for Razor. Fallback for when the treesitter
	--    razor parser is unavailable; delete this block if you don't need it.
	{ "jlcrochet/vim-razor", ft = "razor" },

	-- 5. Treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "c_sharp", "razor" })
		end,
	},

	-- 6. Auto-close tags in markup. If this misbehaves in .razor files, remove it.
	{ "windwp/nvim-ts-autotag", opts = { aliases = { razor = "html" } } },

	-- 7. Format C# with csharpier on save (Razor itself is not auto-formatted)
	{ "stevearc/conform.nvim", opts = { formatters_by_ft = { cs = { "csharpier" } } } },
}
