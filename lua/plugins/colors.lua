return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	name = "nordic",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme nordic")

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

		-- For commenting!
		vim.api.nvim_set_hl(0, "Comment", { fg = "#E6BCC8", italic = true })
		vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
		-- For Line Numbers
		vim.api.nvim_set_hl(0, "LineNr", { link = "Comment" })
		-- For Explorer Untracked Items
		vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { fg = "#A5CED5" })
	end,
}
