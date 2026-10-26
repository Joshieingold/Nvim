-- Toggleable terminal (vertical split on the right, 40% width).
--   <C-/>       toggle terminal
--   <leader>/   send current line / visual selection to the terminal
-- Tip: some terminals send <C-/> as <C-_>; if the toggle does nothing, try that.
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		size = function()
			return math.floor(vim.o.columns * 0.4)
		end,
		open_mapping = [[<C-/>]],
		dir = "git_dir",
		hide_numbers = false,
		shade_terminals = true,
		shading_factor = 1,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		close_on_exit = true,
		shell = vim.o.shell,
		direction = "vertical",
	},
	keys = {
		{ "<C-/>", mode = "n", desc = "Toggle terminal" }, -- lazy-loads the plugin
		{ "<leader>/", "<cmd>ToggleTermSendCurrentLine<cr>", desc = "Send line to terminal" },
		{ "<leader>/", "<cmd>ToggleTermSendVisualSelection<cr>", mode = "v", desc = "Send selection to terminal" },
	},
}
