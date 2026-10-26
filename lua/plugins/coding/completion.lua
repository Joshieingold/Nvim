-- nvim-cmp: completion menu + LuaSnip snippets.
--
--   <C-j>/<C-k>   next / previous item        <C-Space>  open menu
--   <C-b>/<C-f>   scroll docs                 <C-e>      close menu
--   <CR>          confirm (only if you selected something)
--   <Tab>/<S-Tab> jump forward/back inside an active snippet

-- Which snippet collections (friendly-snippets) to also offer per filetype.
-- Add a line here to give a filetype extra snippets.
local snippet_extends = {
	razor = { "html", "csharp" },
	jsp = { "html", "java" },
}

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- source: LSP
		"hrsh7th/cmp-buffer", -- source: words in open buffers
		"hrsh7th/cmp-path", -- source: file paths
		"saadparwaiz1/cmp_luasnip", -- source: snippets
		"rafamadriz/friendly-snippets", -- snippet collection
		"onsails/lspkind.nvim", -- pictograms in the menu
		{ "L3MON4D3/LuaSnip", version = "v2.*", build = "install_jsregexp" },
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()
		for ft, extends in pairs(snippet_extends) do
			luasnip.filetype_extend(ft, extends)
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),

				-- Only jumps inside a snippet that is already expanded;
				-- otherwise Tab behaves normally.
				["<Tab>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			-- Order = priority
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),

			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
