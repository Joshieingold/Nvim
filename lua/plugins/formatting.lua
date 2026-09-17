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
				java = { "clang-format" },

				python = { "isort", "black" },
				sql = { "sleek" },

				cs = { "csharpier" },
			},

			format_on_save = function(bufnr)
				local ft = vim.bo[bufnr].filetype
				if ft == "razor" or ft == "cshtml" then
					return { lsp_fallback = false, async = false, timeout_ms = 3000 }
				end
				return { lsp_fallback = false, async = false, timeout_ms = 3000 }
			end,
			formatters = {
				prettier = {
					prepend_args = { "--tab-width", "4" },
				},

				["clang-format"] = {
					prepend_args = { "--style={IndentWidth: 4}" },
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "==", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
