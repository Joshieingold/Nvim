-- JSP: buffer-local settings.
-- JSP comments are `<%-- ... --%>` (they never reach the browser, unlike <!-- -->).
vim.bo.commentstring = "<%-- %s --%>"
vim.opt_local.matchpairs:append("<:>") -- % jumps between < and >
