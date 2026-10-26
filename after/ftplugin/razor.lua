-- Razor (.razor / .cshtml): buffer-local settings.
-- Markup comments are `@* ... *@`; inside C# blocks use `//` yourself.
vim.bo.commentstring = "@* %s *@"
vim.opt_local.matchpairs:append("<:>") -- % jumps between < and >
