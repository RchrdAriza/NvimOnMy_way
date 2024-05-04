local M = {}

M.icons = {
	close = "󰅙 ",
	dir = "󰉋 ",
	lsp = "  ",
	vim = "  ",
	debug = " ",
	files = {
		details = "󱁻 ",
		ruler = "󰱼 ",
	},
	dashboard = {
		new_file = "󱪝  ",
		lazygit = "  ",
		file_name = "󰈞  ",
		file_recent = "󱦺  ",
		file_grep = "󰺮  ",
		exit = "󰩈  ",
	},
	separators = {
		block = "█",
		dotted_vert = "┊",
		double_vert = "║",
		inverted_slant_left = "",
		inverted_slant_right = "",
		rounded_left = "",
		rounded_right = "",
		slant_br = "",
		slant_left = "",
		slant_right = "",
		slant_ur = "",
		vert = "│",
		vert_thick = "┃",
	},
	diagnostics = {
		error = "",
		hint = "",
		info = "",
		warn = "",
		code_action = " ",
	},
	git = {
		added = "",
		branch = "",
		conflict = "",
		deleted = "",
		ignored = "",
		modified = "",
		removed = "",
		renamed = "",
		staged = "",
		unstaged = "",
		untracked = "",
	},
}

return M
