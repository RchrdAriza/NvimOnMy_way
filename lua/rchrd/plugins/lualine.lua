return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'RchrdAriza/nvim-web-devicons' },
    config = function ()
	    require('lualine').setup {
		    options = {
			    theme = 'tokyonight',
		    },
	    }
    end
}
