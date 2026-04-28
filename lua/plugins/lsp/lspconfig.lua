return {
	"hrsh7th/cmp-nvim-lsp",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})
		vim.lsp.config("clangd", {
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--query-driver=/usr/bin/c++,/usr/bin/g++",
			},
			init_options = {
				fallbackFlags = {
					"-std=c++20",
				},
			},
		})
		vim.lsp.enable("clangd")
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = false,
						library = {
							"${3rd}/love2d/library",
						},
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end,
}
