return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function(_, opts)
			if opts then
				require("luasnip").config.setup(opts)
			end
			vim.tbl_map(function(type)
				require("luasnip.loaders.from_" .. type).lazy_load()
			end, { "vscode", "snipmate", "lua" })
			require("luasnip").filetype_extend("dart", { "flutter" })
			local ls = require("luasnip")
			local t = ls.text_node
			local i = ls.insert_node
			local s = ls.snippet

			ls.add_snippets("javascript", {
				s("<", {
					t("<"),
					i(1),
					t("/>"),
				}),
			})

			ls.add_snippets("dart", {
				s("toc", {
					t("final colors = Theme.of(context).colorScheme;"),
				}),
			})
		end,
	},
	{ "saadparwaiz1/cmp_luasnip" },
}
