return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "RchrdAriza/nvim-web-devicons",
	opts = {
		options = {
			separator_style = "slant",
			mode = "buffers",
			buffer_close_icon = "x",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			color_icons = true,
			custom_areas = {
				right = function()
					local result = {}
					local seve = vim.diagnostic.severity
					local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
					local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
					local info = #vim.diagnostic.get(0, { severity = seve.INFO })
					local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

					if error ~= 0 then
						table.insert(result, { text = "  " .. error, fg = "#EC5241" })
					end

					if warning ~= 0 then
						table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
					end

					if hint ~= 0 then
						table.insert(result, { text = "  " .. hint, fg = "#53FF74" })
					end

					if info ~= 0 then
						table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
					end
					return result
				end,
			},
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					text_align = "left",
					highlight = "Directory",
					separator = true,
				},
			},
		},
	},
}
