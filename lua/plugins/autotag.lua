return {
	-- nvim-ts-autotag plugin
	{
		"windwp/nvim-ts-autotag",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
				filetypes = {
					"html",
					"javascript",
					"javascriptreact",
					"typescriptreact",
					"vue",
					"svelte",
					"tsx",
					"jsx",
				},
				per_filetype = {
					["html"] = {
						enable_close = true,
					},
					["jsx"] = {
						enable_close = true,
					},
					["tsx"] = {
						enable_close = true,
					},
					["js"] = {
						enable_close = true,
					},
				},
			})
		end,
	},

	{
		"windwp/nvim-autopairs",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		event = "InsertEnter",
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({
				check_ts = true,
				ts_config = {
					javascript = { "template_string" },
					java = false,
				},
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
