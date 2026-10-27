-- Loader for :colorscheme blossom
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "blossom"
require("lush")(require("lush_theme.bossom"))
