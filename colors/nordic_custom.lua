vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "nordic_custom"

local c = {
	bg = "#242933",
	bg_alt = "#2E3440",
	fg = "#D8DEE9",
	muted = "#616E88",
	comment = "#E6BCC8",
	blue = "#81A1C1",
	teal = "#A5CED5",
	cyan = "#88C0D0",
	green = "#A3BE8C",
	yellow = "#EBCB8B",
	orange = "#D08770",
	red = "#BF616A",
	purple = "#B48EAD",
	visual = "#434C5E",
}
local transparent = vim.g.transparent_background ~= false
local bg = transparent and "NONE" or c.bg
local bg_alt = transparent and "NONE" or c.bg_alt
local function hi(group, spec)
	vim.api.nvim_set_hl(0, group, spec)
end

-- Core UI
hi("Normal", { fg = c.fg, bg = bg })
hi("NormalNC", { fg = c.fg, bg = bg })
hi("NormalFloat", { fg = c.fg, bg = bg_alt })
hi("FloatBorder", { fg = c.muted, bg = bg_alt })
hi("SignColumn", { bg = bg })
hi("FoldColumn", { fg = c.muted, bg = bg })
hi("EndOfBuffer", { fg = c.bg, bg = bg })
hi("MsgArea", { fg = c.fg, bg = bg })
hi("LineNr", { fg = c.muted, bg = bg })
hi("CursorLineNr", { fg = c.comment, bold = true, bg = bg })
hi("CursorLine", { bg = bg_alt })
hi("ColorColumn", { bg = bg_alt })
hi("Visual", { bg = c.visual })
hi("Search", { fg = c.bg, bg = c.yellow })
hi("IncSearch", { fg = c.bg, bg = c.orange })
hi("MatchParen", { fg = c.cyan, bold = true, underline = true })
hi("Pmenu", { fg = c.fg, bg = c.bg_alt })
hi("PmenuSel", { fg = c.bg, bg = c.blue, bold = true })
hi("StatusLine", { fg = c.fg, bg = bg_alt })
hi("StatusLineNC", { fg = c.muted, bg = bg })
hi("WinSeparator", { fg = c.muted, bg = bg })
hi("VertSplit", { fg = c.muted, bg = bg })
hi("Folded", { fg = c.muted, bg = bg_alt })

-- Syntax
hi("Comment", { fg = c.comment, italic = true })
hi("Constant", { fg = c.purple })
hi("String", { fg = c.green })
hi("Character", { fg = c.green })
hi("Number", { fg = c.purple })
hi("Boolean", { fg = c.purple })
hi("Identifier", { fg = c.fg })
hi("Function", { fg = c.cyan })
hi("Statement", { fg = c.blue })
hi("Keyword", { fg = c.blue })
hi("Operator", { fg = c.fg })
hi("PreProc", { fg = c.purple })
hi("Type", { fg = c.yellow })
hi("Special", { fg = c.teal })
hi("Todo", { fg = c.bg, bg = c.yellow, bold = true })
hi("Error", { fg = c.red, bold = true })

-- Diagnostics and diffs
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.yellow })
hi("DiagnosticInfo", { fg = c.cyan })
hi("DiagnosticHint", { fg = c.green })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
hi("DiffAdd", { fg = c.green })
hi("DiffChange", { fg = c.yellow })
hi("DiffDelete", { fg = c.red })

-- Treesitter captures (groups fall back to legacy syntax groups where applicable)
hi("@comment", { link = "Comment" })
hi("@variable", { fg = c.fg })
hi("@function", { fg = c.cyan })
hi("@keyword", { fg = c.blue })
hi("@string", { fg = c.green })
hi("@type", { fg = c.yellow })
hi("@tag", { fg = c.blue })
hi("@tag.attribute", { fg = c.yellow })
hi("@tag.delimiter", { fg = c.muted })

-- Snacks explorer custom highlight
hi("SnacksPickerGitStatusUntracked", { fg = c.teal })
