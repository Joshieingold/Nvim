-- Auto-close / auto-rename HTML-style tags using treesitter.
-- Language packs add filetype aliases in lua/plugins/lang/{razor,jsp}.lua
-- (an alias means "treat this filetype like html").
return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		opts = {
			enable_close = true, -- <div> + ">" -> <div></div>
			enable_rename = true, -- rename the closing tag with the opening one
			enable_close_on_slash = false, -- "</" does not auto-complete
		},
	},
}
