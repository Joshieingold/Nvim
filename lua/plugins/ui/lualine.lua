-- Statusline. Your previous config was just lualine's defaults spelled out,
-- so this only states what you actually choose; everything else is default.
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = { theme = "auto" },
	},
}
