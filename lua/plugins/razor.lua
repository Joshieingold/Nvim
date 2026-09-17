return {
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "roslyn", "html-lsp", "css-lsp" })
		end,
	},

	-- Syntax Highlighting for Razor
	{
		"jlcrochet/vim-razor",
		ft = { "razor", "cshtml" },
	},

	-- The modern Roslyn LSP Client (Handles C# and Razor Cohosting)
	{
		"seblyng/roslyn.nvim",
		ft = { "cs", "razor", "cshtml" },
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			-- Configuration options can be modified here if required
		},
	},

	-- Setup HTML & CSS servers via lspconfig for frontend support inside Razor
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				html = { filetypes = { "html", "razor", "cshtml" } },
				cssls = { filetypes = { "css", "scss", "less", "razor", "cshtml" } },
			},
		},
	},
}
