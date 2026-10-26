-- conform.nvim: formatting on save + manual formatting with `==`.
--
-- Add a formatter:  opts.formatters_by_ft.<filetype> = { "tool" }
-- (and add the tool to mason-tool-installer in lsp/mason.lua).
-- C# is added by lang/razor.lua.
--
-- Razor / JSP: deliberately NOT formatted on save (no reliable formatter).
-- `==` falls back to the LSP formatter if one is attached (Razor via roslyn).
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"==",
			function()
				require("conform").format({ lsp_format = "fallback", async = true, timeout_ms = 1000 })
			end,
			mode = { "n", "v" },
			desc = "Format file or range",
		},
	},
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			svelte = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			liquid = { "prettier" },

			lua = { "stylua" },
			cpp = { "clang-format" },
			java = { "clang-format" },
			python = { "isort", "black" },
			sql = { "sleek" },
		},

		-- Only run the configured formatters above; never fall back to the LSP
		-- on save (this replaces the old function whose two branches were identical).
		format_on_save = { lsp_format = "never", timeout_ms = 3000 },

		formatters = {
			prettier = { prepend_args = { "--tab-width", "4" } },
			["clang-format"] = { prepend_args = { "--style={IndentWidth: 4}" } },
		},
	},
}
