-- Shared transparency policy. `NONE` lets the terminal emulator draw its background.
-- Set false to keep the active colorscheme's background colors.
vim.g.transparent_background = true

local group = vim.api.nvim_create_augroup("UserThemeTransparency", { clear = true })
local transparent_groups = {
	"Normal",
	"NormalNC",
	"NormalFloat",
	"FloatBorder",
	"SignColumn",
	"EndOfBuffer",
	"MsgArea",
	"FoldColumn",
	"StatusLine",
	"StatusLineNC",
	"WinSeparator",
	"VertSplit",
	"LineNr",
	"CursorLineNr",
}

local function apply_transparency()
	if not vim.g.transparent_background then
		return
	end
	for _, name in ipairs(transparent_groups) do
		local ok, current = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
		if ok then
			current.bg = nil
			vim.api.nvim_set_hl(0, name, current)
		else
			vim.api.nvim_set_hl(0, name, { bg = "NONE" })
		end
	end
end

vim.api.nvim_create_autocmd("ColorScheme", {
	group = group,
	callback = apply_transparency,
})

-- Also apply to the colorscheme loaded before this module, if any.
apply_transparency()
