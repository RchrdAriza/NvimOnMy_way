return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local presets = require("which-key.plugins.presets")
		presets.operators["v"] = nil
		presets.operators["g"] = nil

		local wk = require("which-key")

		wk.setup({
			window = {
				border = "double", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 5, 1, 5 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
				winblend = 15, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				zindex = 1000, -- positive value to position WhichKey above other floating windows.
			},

			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "-", -- symbol used between a key and it's label
				group = "", -- symbol prepended to a group
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 5, -- spacing between columns
				align = "center", -- align columns left, center or right
			},
		})

		wk.register({
			["<Space><Space>"] = { "<cmd>noh<cr>", "󰫙 Noh" },
			["<Space>e"] = { "<cmd>Neotree<cr>", " File Explorer" },
			["<Space>n"] = { "<cmd>enew<cr>", " New file" },
			["<Space>r"] = { "<cmd>Telescope oldfiles<cr>", "󰷊 Open recent files" },
			["<Space>h"] = { "<cmd>Alpha<cr>", " Go to menu" },
			["<Space>q"] = { "<cmd>q!<cr>", "󰩈 Exit" },
			["<Space>x"] = { "<cmd>x<cr>", "󰗼 Exit and save" },
			["<Space>R"] = { "<cmd>RunCode<cr>", " Run Code" },
			-- ["<Space>d"] = { "<cmd>AerialToggle!<cr>", " See details" },
			["<Space>a"] = { "<cmd>ASToggle<cr>", " AutoSave On/Off" },
			-- ["<Space>c"] = { "<cmd>:lua countAndCloseBuffers()<cr>", "󱎘 Close tab" },
		})

		wk.register({
			["<Space>d"] = {
				name = " See details",
				e = { "<cmd>TroubleToggle<cr>", "See errors" },
				f = { "<cmd>AerialToggle!<cr>", "See functions" },
			},
		})
		wk.register({
			["<Space>f"] = {
				name = " Telescope",
				f = { "<cmd>Telescope find_files<cr>", "Find_files" },
				g = { "<cmd>Telescope live_grep<cr>", "live_grep" },
				b = { "<cmd>Telescope buffers<cr>", "Buffers" },
				h = { "<cmd>Telescope help_tags<cr>", "Help_tags" },
			},
		})

		wk.register({
			["<Space>l"] = {
				name = " Lsp-Actions",
				D = { "<cmd>:lua vim.lsp.buf.declaration()<cr>", "lsp.buf.declaration" },
				d = { "<cmd>:lua vim.lsp.buf.definition()<cr>", "vim.lsp.buf.definition" },
				h = { "<cmd>:lua vim.lsp.buf.hover()<cr>", "lsp.buf.hover" },
				i = { "<cmd>:lua vim.lsp.buf.implementation()<cr>", "lsp.buf.implementation" },
				r = { "<cmd>:lua vim.lsp.buf.rename()<cr>", "lsp.buf.rename" },
				a = { "<cmd>:lua vim.lsp.buf.code_action()<cr>", "lsp.buf.code_action" },
				t = { "<cmd>:lua vim.lsp.buf.type_definition()<cr>", "lsp.buf.type_definition" },
			},
		})

		wk.register({
			["<Space>g"] = {
				name = "󰊢 Git",
				a = { "<cmd>Gwrite<cr>", "Git Add [this file]" },
				s = { "<cmd>Neotree float git_status<cr>", "Git Status" },
				c = { "<cmd>Git commit<cr>", "Git Commit" },
				d = { "<cmd>DiffviewOpen<cr>", "Git Diff" },
			},
		})

		wk.register({
			["<Space>t"] = {
				name = " Terminal",
				h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal term" },
				f = { "<cmd>ToggleTerm direction=float<cr>", "Floating terminal" },
				t = { "<cmd>ToggleTerm direction=tab<cr>", "Tab terminal" },
				v = { "<cmd>ToggleTerm size=50 direction=vertical<cr>", "Vertical term" },
			},
		})
	end,
}
