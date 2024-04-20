return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "RchrdAriza/nvim-web-devicons" },
		config = function()
        -- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

			require("lualine").setup({
				options = {
					component_separators = "|",
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{
							"mode",
							-- separator = { left = "" },
							-- fmt = function(str)
							-- 	return str:sub(1, 1)
							-- end,
							right_padding = 1,
						},
					},
					lualine_b = { "branch" },
					lualine_c = {

						{
							"filename",
							file_status = true,
							newfile_status = false,
							path = 0,

							shorting_target = 40,
							symbols = {
								modified = "",
								readonly = "",
								unnamed = "[No Name]",
								newfile = "",
							},
						},
					},
					lualine_x = { "diff" },
					lualine_y = { { "filetype", icon_only = true, icon = { align = "right" } }, "progress" },
					lualine_z = {
						{
							"location", --[[ separator = { right = "" }, ]]
							left_padding = 1,
						},
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
				tabline = {},
				extensions = {},
			})
			-- sections = {}
			--
		end,
	},
}
