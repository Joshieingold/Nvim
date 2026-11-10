return {
	"4DRIAN0RTIZ/complexity.nvim",
	build = "pipx install lizard",
	config = function()
		require("complexity").setup({})
	end,
	keys = {
		{ "<leader>cc", "<cmd>ShowComplexity<CR>", desc = "Show Code Complexity" },
	},
}
