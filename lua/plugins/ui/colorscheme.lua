local active = "rose_pine" -- "nordic_custom" | "blossom" | "nordic" | "rose_pine"

return {
	"AlexvZyl/nordic.nvim",
	name = "nordic",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme(active)
	end,
}
