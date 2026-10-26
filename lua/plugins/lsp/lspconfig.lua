-- Core LSP wiring. Per-server settings are NOT here: each server has its own
-- file in <config>/lsp/<server>.lua (native Neovim 0.11 mechanism), e.g.
-- lsp/clangd.lua, lsp/lua_ls.lua, lsp/html.lua, lsp/roslyn.lua.
--
-- To configure a new server: create lsp/<name>.lua returning a table, and either
-- add it to the enable-list below (system-installed server) or to
-- ensure_installed in lsp/mason.lua (mason-lspconfig enables those itself).
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig.nvim",
		{ "folke/lazydev.nvim", ft = "lua", opts = {} }, -- Neovim API types for lua_ls
	},
	config = function()
		-- Every server gets cmp's completion capabilities
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		-- Servers that are enabled explicitly (clangd comes from your system,
		-- the rest are also auto-enabled by mason-lspconfig; enabling twice is harmless).
		vim.lsp.enable({ "clangd", "lua_ls", "html", "cssls", "emmet_ls" })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
			desc = "LSP buffer-local keymaps",
			callback = function(event)
				local function map(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
				map("<leader>ca", vim.lsp.buf.code_action, "Code action")
				-- Navigation (gd, gr, gI, ...) lives in editor/snacks.lua
			end,
		})
	end,
}
