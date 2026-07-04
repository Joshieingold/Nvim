return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	name = "cyberdream",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme cyberdream")

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
