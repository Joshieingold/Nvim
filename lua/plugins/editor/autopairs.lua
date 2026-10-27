-- Auto-close brackets/quotes, integrated with nvim-cmp.
-- (HTML/Razor/JSP *tag* closing is handled by editor/autotag.lua.)
return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = { "hrsh7th/nvim-cmp" },
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true, -- use treesitter to avoid pairing inside strings etc.
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
				java = { "string_literal" },
			},
		})

		-- Add "()" after accepting a function completion
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
