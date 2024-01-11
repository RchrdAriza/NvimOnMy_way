--  ╭──────────────────────────────────────────────────────────╮
--  │                         Content                          │
--  ╰──────────────────────────────────────────────────────────╯
--  ╭──────────────────────────────────────────────────────────╮
--  │                      -- Plugins --                       │
--  │                         Lualine                          │
--  │                        bufferline                        │
--  ╰──────────────────────────────────────────────────────────╯
--

local colors = {
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode", "lsp_progress" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "filetype" },
		lualine_y = { "progress" },
		lualine_z = {
			"location",
			function()
				if vim.g.prueba == true then
					return "Live-server: ON"
				else
					return "NvimOnMy_Way❤️"
				end
			end,
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

prueba = "NvimOnMy_Way❤️"

vim.opt.termguicolors = true
require("bufferline").setup({
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
				filetype = "neotree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},
})

-- triggers CursorHold event faster
vim.opt.updatetime = 200

require("barbecue").setup({
	create_autocmd = false, -- prevent barbecue from updating itself automatically
})

vim.api.nvim_create_autocmd({
	"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
	"BufWinEnter",
	"CursorHold",
	"InsertLeave",

	-- include this if you have set `show_modified` to `true`
	"BufModifiedSet",
}, {
	group = vim.api.nvim_create_augroup("barbecue.updater", {}),
	callback = function()
		require("barbecue.ui").update()
	end,
})

require("barbecue.ui").navigate(-1)
