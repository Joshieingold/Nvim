-- C# + Razor server settings (sent to the Roslyn language server).
-- roslyn.nvim supplies cmd / filetypes / root detection itself; only settings here.
-- Full list of options: https://github.com/seblyng/roslyn.nvim#%EF%B8%8F-configuration
return {
	settings = {
		["csharp|completion"] = {
			-- suggest types from namespaces you haven't imported yet (adds the using)
			dotnet_show_completion_items_from_unimported_namespaces = true,
		},
		-- Uncomment to tune diagnostics scope ("openFiles" is lighter, "fullSolution" more thorough):
		-- ["csharp|background_analysis"] = {
		--     dotnet_analyzer_diagnostics_scope = "openFiles",
		--     dotnet_compiler_diagnostics_scope = "openFiles",
		-- },
		-- Inlay hints (also need: vim.lsp.inlay_hint.enable(true)):
		-- ["csharp|inlay_hints"] = {
		--     csharp_enable_inlay_hints_for_implicit_variable_types = true,
		--     dotnet_enable_inlay_hints_for_parameters = true,
		-- },
	},
}
