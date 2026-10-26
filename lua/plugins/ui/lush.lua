-- lush.nvim: write colorschemes as Lua with live preview.
--   :Lushify       open a theme file (lua/lush_theme/*.lua), run this, and edit
--                  with real-time feedback
--   :LushRunTutorial
-- Your themes live in:
--   lua/lush_theme/<name>.lua   the theme itself (the lush spec)
--   colors/<name>.lua           tiny loader so `:colorscheme <name>` works
-- Copy lua/lush_theme/blossom.lua + colors/blossom.lua to start a new one.
return {
	"rktjmp/lush.nvim",
	lazy = true, -- loads automatically when a lush theme is applied
	cmd = { "Lushify", "LushRunQuickstart", "LushRunTutorial" },
}
