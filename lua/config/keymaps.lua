-- Global keymaps that don't belong to a specific plugin.
-- Plugin keymaps live next to their plugin spec (search with <leader>sk).
local map = vim.keymap.set

-- Move selected lines up/down and re-indent
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move selection up" })

-- Half-page scroll, keeping the cursor centered
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

-- System clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank to end of line to system clipboard" })

-- Diagnostics
map("n", "<leader>k", vim.diagnostic.open_float, { desc = "Show diagnostic under cursor" })
