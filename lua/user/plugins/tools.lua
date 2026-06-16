return {
	-- ===== init.lua (plenary) =====
	"nvim-lua/plenary.nvim",

	-- ===== telescope.lua =====
	{
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
						treesitter = true,
					},
					mappings = {
						i = { ["<c-t>"] = trouble },
						n = { ["<c-t>"] = trouble },
					},
				},
			})
		end,
	},

	-- ===== filesxplorer.lua =====
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"RchrdAriza/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			require("neo-tree").setup({
			})
		end,
	},

	-- ===== git.lua =====
	{
		{
			"akinsho/git-conflict.nvim",
			version = "*",
			config = true,
		},
		{ "lewis6991/gitsigns.nvim", opts = {} },
		{
			"kdheepak/lazygit.nvim",
			cmd = {
				"LazyGit",
				"LazyGitConfig",
				"LazyGitCurrentFile",
				"LazyGitFilter",
				"LazyGitFilterCurrentFile",
			},
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			keys = {
				-- { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
			},
		},
	},

	-- ===== terminal.lua =====
	{
		{ "akinsho/toggleterm.nvim", version = "*", config = true },
	},

}
