return {
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename paired tags
					enable_close_on_slash = false, -- Do not auto-close on trailing </
				},
				per_filetype = {
					["html"] = {
						enable_close = true, -- Disable auto-close for html specifically
					},
				},
			})
		end,
	},
}
