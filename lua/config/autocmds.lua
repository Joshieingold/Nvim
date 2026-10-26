-- Small, plugin-free autocommands.
local augroup = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	desc = "Briefly highlight yanked text",
	callback = function()
		vim.hl.on_yank()
	end,
})
