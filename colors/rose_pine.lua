-- Loader for :colorscheme rose_pine
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "rose_pine"
require("lush")(require("lush_theme.rose_pine"))
