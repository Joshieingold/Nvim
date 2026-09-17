return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/nvim-cmp",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local autopairs = require("nvim-autopairs")
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		autopairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
				java = false,
			},
		})

		require("nvim-ts-autotag").setup()

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
