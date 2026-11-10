return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	keys = {
		{ "<leader>md", "<cmd>MarkdownPreviewToggle<CR>", desc = "Start/Stop Markdown Preview" },
	},
	ft = { "markdown" },
}
