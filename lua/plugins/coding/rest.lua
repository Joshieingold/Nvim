return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "http")
		end,
	},
	ft = "http", -- Lazy-load when opening .http files
	keys = {
		{ "<leader>rr", "<cmd>Rest run<cr>", desc = "Run HTTP request" },
		{ "<leader>rl", "<cmd>Rest run last<cr>", desc = "Re-run last HTTP request" },
	},
	config = function()
		-- Optional: override default settings
		vim.g.rest_nvim = {
			request = {
				skip_ssl_verification = false,
			},
			response = {
				hooks = {
					decode_url = true,
					format = true,
				},
			},
		}
	end,
}
