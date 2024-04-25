return {
	"nvim-telescope/telescope.nvim",
	--	tag = "0.1.5",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- local actions = require("telescope.actions")
		local trouble = require("trouble.providers.telescope")

		local telescope = require("telescope")

		-- local builtin = require("telescope.builtin")
		vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>Telescope buffers<cr>", { noremap = true })

		telescope.setup({
			defaults = {
				mappings = {
					i = { ["<c-t>"] = trouble.open_with_trouble },
					n = { ["<c-t>"] = trouble.open_with_trouble },
				},
			},
		})
	end,
}
