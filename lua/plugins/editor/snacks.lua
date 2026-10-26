-- snacks.nvim: pickers (find/grep/git/LSP navigation), file explorer, dashboard,
-- notifier, zen mode. This is where most "navigation" hotkeys live.
--
-- Add a picker key:  { "<leader>xx", pick("<source>"), desc = "..." }
-- Browse every source: :lua Snacks.picker()

local function pick(source, opts)
	return function()
		Snacks.picker[source](opts)
	end
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		-- Files ---------------------------------------------------------------
		{ "<leader>ff", pick("smart"), desc = "Smart Find Files" },
		{ "<leader>pf", pick("files", { hidden = true, ignored = true }), desc = "Find ALL Files (hidden + ignored)" },
		{ "<leader>pb", pick("buffers"), desc = "Buffers" },
		{ "<leader>pg", pick("git_files"), desc = "Git Files" },
		{ "<leader>pr", pick("recent"), desc = "Recent Files" },
		{
			"<leader>pv",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},

		-- Git -----------------------------------------------------------------
		{ "<leader>gb", pick("git_branches"), desc = "Git Branches" },
		{ "<leader>gl", pick("git_log"), desc = "Git Log" },
		{ "<leader>gL", pick("git_log_line"), desc = "Git Log Line" },
		{ "<leader>gs", pick("git_status"), desc = "Git Status" },
		{ "<leader>gS", pick("git_stash"), desc = "Git Stash" },
		{ "<leader>gd", pick("git_diff"), desc = "Git Diff (Hunks)" },
		{ "<leader>gf", pick("git_log_file"), desc = "Git Log File" },
		{ "<leader>gi", pick("gh_issue"), desc = "GitHub Issues (open)" },
		{ "<leader>gI", pick("gh_issue", { state = "all" }), desc = "GitHub Issues (all)" },
		{ "<leader>gp", pick("gh_pr"), desc = "GitHub PRs (open)" },
		{ "<leader>gP", pick("gh_pr", { state = "all" }), desc = "GitHub PRs (all)" },
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},

		-- Grep ----------------------------------------------------------------
		{ "<leader>sb", pick("lines"), desc = "Buffer Lines" },
		{ "<leader>sB", pick("grep_buffers"), desc = "Grep Open Buffers" },
		{ "<leader>sg", pick("grep"), desc = "Grep" },
		{ "<leader>sw", pick("grep_word"), desc = "Grep word / selection", mode = { "n", "x" } },

		-- Search (Neovim internals) ------------------------------------------
		{ '<leader>s"', pick("registers"), desc = "Registers" },
		{ "<leader>s/", pick("search_history"), desc = "Search History" },
		{ "<leader>sa", pick("autocmds"), desc = "Autocmds" },
		{ "<leader>sc", pick("command_history"), desc = "Command History" },
		{ "<leader>sC", pick("commands"), desc = "Commands" },
		{ "<leader>sd", pick("diagnostics"), desc = "Diagnostics" },
		{ "<leader>sh", pick("help"), desc = "Help Pages" },
		{ "<leader>sH", pick("highlights"), desc = "Highlights" },
		{ "<leader>si", pick("icons"), desc = "Icons" },
		{ "<leader>sj", pick("jumps"), desc = "Jumps" },
		{ "<leader>sk", pick("keymaps"), desc = "Keymaps" },
		{ "<leader>sm", pick("marks"), desc = "Marks" },
		{ "<leader>sM", pick("man"), desc = "Man Pages" },
		{ "<leader>sp", pick("lazy"), desc = "Plugin Specs" },
		{ "<leader>sq", pick("qflist"), desc = "Quickfix List" },
		{ "<leader>sR", pick("resume"), desc = "Resume Last Picker" },
		{ "<leader>su", pick("undo"), desc = "Undo History" },
		{ "<leader>uC", pick("colorschemes"), desc = "Colorschemes" },

		-- LSP navigation ------------------------------------------------------
		{ "gd", pick("lsp_definitions"), desc = "Goto Definition" },
		{ "gD", pick("lsp_declarations"), desc = "Goto Declaration" },
		{ "gr", pick("lsp_references"), nowait = true, desc = "References" },
		{ "gI", pick("lsp_implementations"), desc = "Goto Implementation" },
		{ "gy", pick("lsp_type_definitions"), desc = "Goto Type Definition" },
		{ "gai", pick("lsp_incoming_calls"), desc = "Calls Incoming" },
		{ "gao", pick("lsp_outgoing_calls"), desc = "Calls Outgoing" },
		{ "<leader>ss", pick("lsp_symbols"), desc = "LSP Symbols" },
		{ "<leader>sS", pick("lsp_workspace_symbols"), desc = "LSP Workspace Symbols" },

		-- Misc ----------------------------------------------------------------
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
		{
			"<leader>Z",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Toggle Zoom",
		},
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss Notifications",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>rr",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File (LSP-aware)",
		},
	},

	opts = {
		bigfile = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		rename = { enabled = true },
		scope = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				explorer = { auto_close = true },
			},
		},

		-- Explicitly off:
		input = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },

		zen = {
			enabled = true,
			toggles = {
				dim = true,
				git_signs = false,
				diagnostics = false,
				line_number = false,
				relative_number = false,
				signcolumn = "no",
				indent = false,
			},
		},

		dashboard = {
			preset = {
				-- `keys` omitted on purpose: Snacks' default entries (Find File,
				-- New File, Find Text, Recent, Config, Restore Session, Lazy, Quit)
				-- match what you had, with proper icons.
				header = [[
|\ |         |  /  o
| \| ,-. ,-. | /   . ;-.-.
|  | |-' | | |/    | | | |
'  ' `-' `-' '     ' ' ' ' 
]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", indent = 1, padding = 1 },
				{ section = "recent_files", title = "Recent Files", indent = 3, padding = 2 },
				{ section = "startup" },
			},
		},
	},
}
