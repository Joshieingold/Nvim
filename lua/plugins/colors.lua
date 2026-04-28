return {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme rose-pine")

		local transparent_groups = {
			"Normal",
			"NormalNC",
			"SignColumn",
			"EndOfBuffer",
			"MsgArea",
			"FoldColumn",
			"CursorLineNr",
			"NormalFloat",
			"FloatBorder",
			"StatusLine",
			"StatusLineNC",
			"VertSplit",
		}

		for _, group in ipairs(transparent_groups) do
			vim.api.nvim_set_hl(0, group, { bg = "none" })
		end
	end,
}
