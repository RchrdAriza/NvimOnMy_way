return {
	"matbme/JABS.nvim",
	dependencies = { "RchrdAriza/nvim-web-devicons" },
	config = function()
		require("jabs").setup({
			-- Default symbols
			symbols = {
				current = "", -- default 
				split = "", -- default 
				alternate = "󰪹", -- default 
				hidden = "󰘓", -- default ﬘
				locked = "", -- default 
				ro = "R", -- default 
				edited = "", -- default 
				terminal = "", -- default 
				default_file = "D", -- Filetype icon if not present in nvim-web-devicons. Default 
				terminal_symbol = ">_", -- Filetype icon for a terminal split. Default 
			},
			preview = {
				width = 40, -- default 70
				height = 60, -- default 30
				border = "rounded", -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
			},
			use_devicons = true,
		})
	end,
}
