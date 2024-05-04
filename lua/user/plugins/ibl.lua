return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	dependencies = "nvim-treesitter/nvim-treesitter",
	-- opts = {},
	config = function()
		require("ibl").setup()
	end,
}
