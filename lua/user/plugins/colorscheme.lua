return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		transparent = vim.g.transparent_enabled, -- make sure to load this with a transparent background
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({})
			require("transparent").clear_prefix("NeoTree")
			require("transparent").clear_prefix("BufferLine")
			-- require("transparent").clear_prefix("lualine")
		end,
	},
}
