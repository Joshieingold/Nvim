-- Loader so `:colorscheme nordic_custom` works.
vim.cmd.colorscheme("nordic") -- stock nordic first
vim.g.colors_name = "nordic_custom"
require("lush")(require("lush_theme.nordic_custom")) -- then your tweaks
