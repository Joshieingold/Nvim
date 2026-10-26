-- Filetype detection + treesitter language mapping for web-templating languages.
-- Per-language behaviour lives in lua/plugins/lang/*.lua and after/ftplugin/*.lua.

vim.filetype.add({
	extension = {
		-- Both Razor Pages (.cshtml) and Blazor (.razor) use the single "razor"
		-- filetype so roslyn.nvim (which handles Razor itself) attaches to both.
		razor = "razor",
		cshtml = "razor",
		-- Java Server Pages (+ fragments)
		jsp = "jsp",
		jspf = "jsp",
	},
})

-- JSP has no treesitter grammar; reuse the HTML one for things that only need
-- the tag structure (e.g. nvim-ts-autotag). Highlighting is handled separately,
-- see lua/plugins/lang/jsp.lua.
vim.treesitter.language.register("html", "jsp")
