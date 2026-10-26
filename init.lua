-- Entry point. Order matters:
--   options   -> sets <leader> (must exist before any plugin registers keymaps)
--   filetypes -> custom filetype detection (razor, jsp)
--   lazy      -> plugin manager; loads everything in lua/plugins/**
--   keymaps / autocmds -> plain-Neovim config that doesn't depend on plugins
require("config.options")
require("config.filetypes")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
