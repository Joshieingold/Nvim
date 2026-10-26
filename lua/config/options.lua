-- Core editor options (no plugin-specific settings here).
vim.g.mapleader = " "

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation: 4 spaces, never literal tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.hlsearch = false
opt.incsearch = true

-- UI
opt.termguicolors = true
opt.scrolloff = 8 -- keep 8 lines visible above/below the cursor
opt.signcolumn = "yes" -- always reserve space so text doesn't jump
opt.colorcolumn = "80"

-- Milliseconds of idle time before CursorHold fires / swap is written.
-- 50 is very snappy; raise it (e.g. 250) if plugins feel chatty.
opt.updatetime = 50
