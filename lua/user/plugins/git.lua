return {
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
			{ "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
