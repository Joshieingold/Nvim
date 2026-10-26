-- JSP (Java Server Pages) support.
--
-- Reality check: there is no JSP-aware language server or treesitter grammar.
-- What you get is:
--   * Syntax: Vim's built-in jsp syntax (understands <% %>, ${...}, <jsp:*>,
--             taglibs and highlights embedded Java). Treesitter highlighting is
--             switched OFF for jsp because the HTML grammar would treat scriptlets
--             as plain text and lose that.
--   * HTML + CSS completion via the html / cssls servers (lsp/html.lua, lsp/cssls.lua)
--   * Emmet (lsp/emmet_ls.lua), auto-close/rename tags (alias below), snippets
--     (html + java, see coding/completion.lua), comments (after/ftplugin/jsp.lua)
--   * No completion/diagnostics for Java *inside* scriptlets, and no formatter.
--
-- Filetype detection: lua/config/filetypes.lua (also registers html as the
-- treesitter language for jsp).
return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "java", "html", "css", "javascript" })

			opts.highlight = opts.highlight or {}
			local previous_disable = opts.highlight.disable
			opts.highlight.disable = function(lang, buf)
				if vim.bo[buf].filetype == "jsp" then
					return true -- fall back to Vim's jsp syntax
				end
				if type(previous_disable) == "function" then
					return previous_disable(lang, buf)
				end
				return false
			end
		end,
	},

	-- Treat jsp like html for tag auto-close / rename
	{ "windwp/nvim-ts-autotag", opts = { aliases = { jsp = "html" } } },
}
