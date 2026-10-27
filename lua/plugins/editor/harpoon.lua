-- Harpoon 2: pin a handful of files per project and jump between them.
--   <leader>a  add current file      <C-e>  open the list
--   <C-h/j/k/l>  jump to file 1/2/3/4
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
				key = function()
					return nvim.uv.cwd() -- one list per working directory
				end,
			},
		})

		local map = nvim.keymap.set
		map("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Harpoon: add file" })
		map("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon: list" })

		for index, key in ipairs({ "<C-h>", "<C-j>", "<C-k>", "<C-l>" }) do
			map("n", key, function()
				harpoon:list():select(index)
			end, { desc = "Harpoon: file " .. index })
		end
	end,
}
