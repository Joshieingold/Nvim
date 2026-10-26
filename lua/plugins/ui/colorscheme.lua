-- Colorscheme (nordic) with a transparent background and a few custom highlights.
-- The overrides run from a ColorScheme autocmd so they survive a theme re-apply
-- (e.g. when previewing themes with <leader>uC).
return {
	"AlexvZyl/nordic.nvim",
	name = "nordic",
	lazy = false,
	priority = 1000, -- load before every other plugin
	config = function()
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

		local function apply_overrides()
			for _, group in ipairs(transparent_groups) do
				vim.api.nvim_set_hl(0, group, { bg = "none" })
			end

			-- Comments + line numbers share a soft pink
			vim.api.nvim_set_hl(0, "Comment", { fg = "#E6BCC8", italic = true })
			vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
			vim.api.nvim_set_hl(0, "LineNr", { link = "Comment" })

			-- Snacks explorer: untracked files
			vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { fg = "#A5CED5" })
		end

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "nordic",
			callback = apply_overrides,
		})

		vim.cmd.colorscheme("nordic")
	end,
}
