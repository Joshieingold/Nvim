-- Blossom: a soft, rose-tinted dark colorscheme for Neovim.
-- Edit this file and use :Lushify for live preview.
-- Background transparency follows vim.g.transparent_background (true by default).

local lush = require("lush")
local hsl = lush.hsl

local transparent = vim.g.transparent_background ~= false
local bg = hsl("#28232D")
local bg_alt = hsl("#332B38")
local bg_highlight = hsl("#403344")
local fg = hsl("#E9DFE8")
local fg_dim = hsl("#C0B2C2")
local muted = hsl("#8E7F93")
local rose = hsl("#E6A2B5")
local pink = hsl("#F0BDD0")
local peach = hsl("#E9B99D")
local lavender = hsl("#C6ADEA")
local purple = hsl("#A992D2")
local teal = hsl("#9DD5D0")
local blue = hsl("#9DBDE8")
local green = hsl("#B5D6A6")
local yellow = hsl("#E8D19A")
local red = hsl("#EF8996")
local none = "NONE"
local editor_bg = transparent and none or bg
local float_bg = transparent and none or bg_alt
local selection_bg = bg_highlight

---@diagnostic disable: undefined-global
return lush(function(injected)
	local sym = injected.sym

	return {
		-- Core editor ---------------------------------------------------------
		Normal({ fg = fg, bg = editor_bg }),
		NormalNC({ fg = fg, bg = editor_bg }),
		NormalFloat({ fg = fg, bg = float_bg }),
		FloatBorder({ fg = muted, bg = float_bg }),
		FloatTitle({ fg = pink, bg = float_bg, gui = "bold" }),
		SignColumn({ fg = muted, bg = editor_bg }),
		FoldColumn({ fg = muted, bg = editor_bg }),
		EndOfBuffer({ fg = transparent and muted or bg_alt }),
		NonText({ fg = muted }),
		Whitespace({ fg = bg_highlight }),
		Conceal({ fg = muted }),
		Directory({ fg = lavender, gui = "bold" }),
		Title({ fg = pink, gui = "bold" }),
		MatchParen({ fg = pink, bg = bg_highlight, gui = "bold" }),
		Search({ fg = bg, bg = yellow }),
		IncSearch({ fg = bg, bg = rose, gui = "bold" }),
		CurSearch({ IncSearch }),
		Visual({ bg = selection_bg }),
		VisualNOS({ Visual }),
		Cursor({ fg = bg, bg = pink }),
		lCursor({ Cursor }),
		CursorLine({ bg = transparent and none or bg_alt }),
		CursorColumn({ CursorLine }),
		ColorColumn({ bg = transparent and none or bg_alt }),
		LineNr({ fg = muted }),
		CursorLineNr({ fg = pink, gui = "bold" }),
		WinSeparator({ fg = bg_highlight }),
		VertSplit({ WinSeparator }),
		StatusLine({ fg = fg, bg = transparent and none or bg_alt }),
		StatusLineNC({ fg = muted, bg = transparent and none or bg_alt }),
		TabLine({ fg = fg_dim, bg = transparent and none or bg_alt }),
		TabLineSel({ fg = pink, bg = bg_highlight, gui = "bold" }),
		TabLineFill({ bg = editor_bg }),
		Pmenu({ fg = fg, bg = bg_alt }),
		PmenuSel({ fg = bg, bg = pink, gui = "bold" }),
		PmenuSbar({ bg = bg_highlight }),
		PmenuThumb({ bg = rose }),
		WildMenu({ fg = bg, bg = pink }),
		QuickFixLine({ bg = bg_highlight }),
		Folded({ fg = muted, bg = transparent and none or bg_alt }),
		WinBar({ fg = fg_dim, bg = editor_bg }),
		WinBarNC({ fg = muted, bg = editor_bg }),
		MsgArea({ fg = fg, bg = editor_bg }),
		ModeMsg({ fg = teal, gui = "bold" }),
		MoreMsg({ fg = teal }),
		Question({ fg = teal, gui = "bold" }),
		ErrorMsg({ fg = red, gui = "bold" }),
		WarningMsg({ fg = yellow }),

		-- Syntax --------------------------------------------------------------
		Comment({ fg = muted, gui = "italic" }),
		Constant({ fg = peach }),
		String({ fg = green }),
		Character({ String }),
		Number({ fg = peach }),
		Boolean({ fg = peach, gui = "bold" }),
		Float({ Number }),
		Identifier({ fg = fg }),
		Function({ fg = blue }),
		Statement({ fg = rose }),
		Conditional({ fg = rose }),
		Repeat({ fg = rose }),
		Label({ fg = lavender }),
		Operator({ fg = pink }),
		Keyword({ fg = lavender }),
		Exception({ fg = red }),
		PreProc({ fg = lavender }),
		Include({ fg = lavender }),
		Define({ fg = lavender }),
		Macro({ fg = peach }),
		PreCondit({ fg = lavender }),
		Type({ fg = teal }),
		StorageClass({ fg = lavender }),
		Structure({ fg = teal }),
		Typedef({ fg = teal }),
		Special({ fg = peach }),
		SpecialChar({ fg = peach }),
		Tag({ fg = rose }),
		Delimiter({ fg = fg_dim }),
		SpecialComment({ fg = muted, gui = "italic" }),
		Debug({ fg = red }),
		Underlined({ fg = blue, gui = "underline" }),
		Ignore({ fg = muted }),
		Error({ fg = red, gui = "bold,underline" }),
		Todo({ fg = bg, bg = yellow, gui = "bold" }),

		-- Tree-sitter captures -------------------------------------------------
		sym("@comment")({ Comment }),
		sym("@comment.documentation")({ fg = muted, gui = "italic" }),
		sym("@constant")({ Constant }),
		sym("@constant.builtin")({ fg = peach, gui = "italic" }),
		sym("@constant.macro")({ Macro }),
		sym("@string")({ String }),
		sym("@string.escape")({ fg = pink, gui = "bold" }),
		sym("@string.regex")({ fg = yellow }),
		sym("@character")({ Character }),
		sym("@number")({ Number }),
		sym("@boolean")({ Boolean }),
		sym("@function")({ Function }),
		sym("@function.call")({ Function }),
		sym("@function.builtin")({ fg = blue, gui = "italic" }),
		sym("@function.method")({ Function }),
		sym("@function.method.call")({ Function }),
		sym("@constructor")({ fg = teal }),
		sym("@parameter")({ fg = fg_dim }),
		sym("@variable")({ fg = fg }),
		sym("@variable.builtin")({ fg = rose, gui = "italic" }),
		sym("@property")({ fg = teal }),
		sym("@field")({ fg = teal }),
		sym("@type")({ Type }),
		sym("@type.builtin")({ fg = teal, gui = "italic" }),
		sym("@attribute")({ fg = yellow }),
		sym("@keyword")({ Keyword }),
		sym("@keyword.function")({ fg = lavender }),
		sym("@keyword.return")({ fg = rose, gui = "bold" }),
		sym("@keyword.operator")({ fg = pink }),
		sym("@operator")({ Operator }),
		sym("@punctuation.delimiter")({ fg = fg_dim }),
		sym("@punctuation.bracket")({ fg = fg_dim }),
		sym("@punctuation.special")({ fg = rose }),
		sym("@tag")({ fg = rose }),
		sym("@tag.attribute")({ fg = teal }),
		sym("@tag.delimiter")({ fg = muted }),

		-- Diagnostics and LSP -------------------------------------------------
		DiagnosticError({ fg = red }),
		DiagnosticWarn({ fg = yellow }),
		DiagnosticInfo({ fg = blue }),
		DiagnosticHint({ fg = teal }),
		DiagnosticOk({ fg = green }),
		DiagnosticUnderlineError({ gui = "undercurl", sp = red }),
		DiagnosticUnderlineWarn({ gui = "undercurl", sp = yellow }),
		DiagnosticUnderlineInfo({ gui = "undercurl", sp = blue }),
		DiagnosticUnderlineHint({ gui = "undercurl", sp = teal }),
		DiagnosticVirtualTextError({ fg = red, bg = transparent and none or bg_alt }),
		DiagnosticVirtualTextWarn({ fg = yellow, bg = transparent and none or bg_alt }),
		DiagnosticVirtualTextInfo({ fg = blue, bg = transparent and none or bg_alt }),
		DiagnosticVirtualTextHint({ fg = teal, bg = transparent and none or bg_alt }),
		LspReferenceText({ bg = bg_highlight }),
		LspReferenceRead({ bg = bg_highlight }),
		LspReferenceWrite({ bg = bg_highlight }),
		LspInlayHint({ fg = muted, gui = "italic" }),

		-- Git signs ------------------------------------------------------------
		GitSignsAdd({ fg = green }),
		GitSignsChange({ fg = yellow }),
		GitSignsDelete({ fg = red }),

		-- Common plugin groups ------------------------------------------------
		WhichKey({ fg = pink, gui = "bold" }),
		WhichKeyGroup({ fg = lavender }),
		WhichKeyDesc({ fg = fg }),
		TelescopeNormal({ fg = fg, bg = float_bg }),
		TelescopeBorder({ fg = muted, bg = float_bg }),
		TelescopeSelection({ fg = pink, bg = bg_highlight, gui = "bold" }),
		TelescopeMatching({ fg = teal, gui = "bold" }),
		SnacksPickerMatch({ fg = teal, gui = "bold" }),
		SnacksPickerSelected({ fg = pink, bg = bg_highlight }),
		SnacksPickerDir({ fg = muted }),
		SnacksPickerGitStatusUntracked({ fg = teal }),
		SnacksPickerGitStatusAdded({ fg = green }),
		SnacksPickerGitStatusModified({ fg = yellow }),
		SnacksPickerGitStatusDeleted({ fg = red }),
		CmpItemAbbr({ fg = fg }),
		CmpItemAbbrMatch({ fg = pink, gui = "bold" }),
		CmpItemKind({ fg = lavender }),
		CmpItemMenu({ fg = muted, gui = "italic" }),
	}
end)
