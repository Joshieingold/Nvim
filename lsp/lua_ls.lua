-- Lua. Neovim API completion comes from lazydev.nvim (see plugins/lsp/lspconfig.lua).
return {
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
				library = { "${3rd}/love2d/library" },
			},
			telemetry = { enable = false },
		},
	},
}
