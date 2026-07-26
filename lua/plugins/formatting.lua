return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
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
				python = { "isort", "black" },
				sql = { "sleek" },
			},
			format_on_save = {
				lsp_fallback = false,
				async = false,
				timeout_ms = 3000,
			},
			formatters = {
				prettier = {
					prepend_args = { "--tab-width", "4" },
				},
				["clang-format"] = {
					prepend_args = { "--style={IndentWidth: 4}" },
				},
			},
		})

		-- Keymap for formatting in normal and visual mode
		vim.keymap.set({ "n", "v" }, "==", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
