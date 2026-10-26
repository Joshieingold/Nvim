-- Mason: installs LSP servers, formatters and other tools.
--   :Mason            browse / install by hand
--   mason-lspconfig   auto-installs the servers below and auto-enables them
--   mason-tool-installer  auto-installs non-LSP tools (formatters, ...)
-- Language packs in lang/*.lua add their own entries (e.g. roslyn).
return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"eslint",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				-- formatters used by coding/formatting.lua
				"prettier",
				"stylua",
				"isort",
				"black",
				"clang-format",
				-- not consumed by any plugin yet (no linter plugin installed)
				"pylint",
				"eslint_d",
			},
		},
	},
}
