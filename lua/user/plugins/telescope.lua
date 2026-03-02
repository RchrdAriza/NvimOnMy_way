return {
	"nvim-telescope/telescope.nvim",
	--	tag = "0.1.5",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- local actions = require("telescope.actions")
		local trouble = require("trouble.sources.telescope").open

		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				preview = {
					treesitter = false,
				},
				mappings = {
					i = { ["<c-t>"] = trouble },
					n = { ["<c-t>"] = trouble },
				},
			},
		})
	end,
}
