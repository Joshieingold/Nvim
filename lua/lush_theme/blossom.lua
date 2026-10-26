-- "blossom": a starter lush theme in your pink palette. Edit freely.
--   1. Open this file and run :Lushify for live preview.
--   2. Apply it with :colorscheme blossom (or set it in plugins/ui/colorscheme.lua).
-- To make another theme: copy this file to lua/lush_theme/<name>.lua,
-- copy colors/blossom.lua to colors/<name>.lua and change the name inside both.
local lush = require("lush")
local hsl = lush.hsl

-- Palette ---------------------------------------------------------------------
local transparent = true -- true: let the terminal background show through
local bg = hsl("#2B2530")
local bg_alt = hsl("#352E3B") -- popups, cursorline, statusline
local fg = hsl("#E8DDE4")
local pink = hsl("#E6BCC8") -- comments, line numbers
local rose = hsl("#D98BA3")
local teal = hsl("#A5CED5")
local gold = hsl("#E5C890")
local green = hsl("#A9C9A4")
local purple = hsl("#BFA6D9")
local red = hsl("#E06C75")
local grey = hsl("#7A6E80")

local normal_bg = transparent and "NONE" or bg

---@diagnostic disable: undefined-global
local theme = lush(function(injected)
	local sym = injected.sym
	return {
		-- Editor UI
		Normal({ fg = fg, bg = normal_bg }),
		NormalNC({ Normal }),
		NormalFloat({ fg = fg, bg = transparent and "NONE" or bg_alt }),
		FloatBorder({ fg = grey, bg = NormalFloat.bg }),
		SignColumn({ bg = "NONE" }),
		EndOfBuffer({ fg = bg }),
		LineNr({ fg = pink }),
		CursorLineNr({ fg = rose, gui = "bold" }),
		CursorLine({ bg = bg_alt }),
		ColorColumn({ bg = bg_alt }),
		Visual({ bg = hsl("#4A3F52") }),
		Search({ fg = bg, bg = gold }),
		IncSearch({ fg = bg, bg = rose }),
		MatchParen({ fg = rose, gui = "bold,underline" }),
		Pmenu({ fg = fg, bg = bg_alt }),
		PmenuSel({ fg = bg, bg = rose }),
		StatusLine({ fg = fg, bg = "NONE" }),
		StatusLineNC({ fg = grey, bg = "NONE" }),
		WinSeparator({ fg = grey }),
		Folded({ fg = grey, bg = bg_alt }),

		-- Syntax
		Comment({ fg = pink, gui = "italic" }),
		Constant({ fg = purple }),
		String({ fg = green }),
		Number({ fg = purple }),
		Boolean({ fg = purple }),
		Identifier({ fg = fg }),
		Function({ fg = teal }),
		Statement({ fg = rose }),
		Keyword({ fg = rose }),
		Operator({ fg = fg }),
		PreProc({ fg = rose }),
		Type({ fg = gold }),
		Special({ fg = teal }),
		Todo({ fg = bg, bg = gold, gui = "bold" }),
		Error({ fg = red }),

		-- Diagnostics
		DiagnosticError({ fg = red }),
		DiagnosticWarn({ fg = gold }),
		DiagnosticInfo({ fg = teal }),
		DiagnosticHint({ fg = green }),
		DiagnosticUnderlineError({ gui = "undercurl", sp = red }),
		DiagnosticUnderlineWarn({ gui = "undercurl", sp = gold }),

		-- Diff / git
		DiffAdd({ fg = green }),
		DiffChange({ fg = gold }),
		DiffDelete({ fg = red }),

		-- Treesitter: most of these fall back to the groups above automatically.
		-- Override individual ones here, e.g.
		sym("@comment")({ Comment }),
		sym("@variable")({ fg = fg }),
		sym("@tag")({ fg = rose }),
		sym("@tag.attribute")({ fg = gold }),
		sym("@tag.delimiter")({ fg = grey }),

		-- Plugins
		SnacksPickerGitStatusUntracked({ fg = teal }),
	}
end)

return theme
