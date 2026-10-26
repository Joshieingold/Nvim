local active = "nordic_custom" -- "nordic_custom" | "blossom" | "nordic"

return {
	"AlexvZyl/nordic.nvim",
	name = "nordic",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme(active)
	end,
}
