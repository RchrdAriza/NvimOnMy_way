return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			relculright = true,
			segments = {
				{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa", maxwidth = 2 },
				-- {
				-- 	sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
				-- 	click = "v:lua.ScSa",
				-- },
				{ text = { "%s" }, click = "v:lua.ScSa" },
				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
			},
		})
	end,
}
