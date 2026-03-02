return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({ preset = "modern" })

		wk.add({
			-- Grupos y keymaps CON icono van aquí
			{ "<leader>t", group = "Telescope", icon = { icon = "", color = "blue" } },
			{ "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find files", icon = "󰈞" },
			{ "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Live grep", icon = "󰈈" },
			{ "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Buffers", icon = "󰕬" },
			{ "<leader>th", "<cmd>Telescope help_tags<cr>", desc = "Help tags", icon = "" },

			{ "<leader>l", group = "LSP Actions", icon = { icon = "", color = "cyan" } },
			{ "<leader>lD", vim.lsp.buf.declaration, desc = "Declaration", icon = "" },
			{ "<leader>ld", vim.lsp.buf.definition, desc = "Definition", icon = "󰊕" },
			{ "<leader>lh", vim.lsp.buf.hover, desc = "Hover", icon = "" },
			{ "<leader>li", vim.lsp.buf.implementation, desc = "Implementation", icon = "" },
			{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename", icon = "󰑕" },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "Code action", icon = "" },
			{ "<leader>le", vim.diagnostic.open_float, desc = "Diagnostics", icon = "" },
			{ "<leader>lt", vim.lsp.buf.type_definition, desc = "Type definition", icon = "" },
			{ "<leader>lR", vim.lsp.buf.references, desc = "References", icon = "" },
			{ "<leader>ls", vim.lsp.buf.signature_help, desc = "Signature help", icon = "" },

			{ "<leader>g", group = "Git", icon = { icon = "", color = "orange" } },
			{ "<leader>ga", "<cmd>Gwrite<cr>", desc = "Git add", icon = "" },
			{ "<leader>gs", "<cmd>Neotree float git_status<cr>", desc = "Git status", icon = "" },
			{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit", icon = "" },
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git diff", icon = "" },

			{ "<leader>T", group = "Terminal", icon = { icon = "", color = "green" } },
			{ "<leader>Th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal", icon = "" },
			{ "<leader>Tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float", icon = "󰉈" },
			{ "<leader>Tt", "<cmd>ToggleTerm direction=tab<cr>", desc = "Tab", icon = "󰓩" },
			{ "<leader>Tv", "<cmd>ToggleTerm size=50 direction=vertical<cr>", desc = "Vertical", icon = "" },

			-- Keymaps generales también aquí para tener iconos
			{ "<leader><Space>", "<cmd>noh<cr>", desc = "Clear highlights", icon = "󰸱" },
			{ "<leader>e", "<cmd>Neotree<cr>", desc = "File explorer", icon = "" },
			{ "<leader>n", "<cmd>enew<cr>", desc = "New file", icon = "" },
			{ "<leader>r", "<cmd>Telescope oldfiles<cr>", desc = "Recent files", icon = "󰙰" },
			{ "<leader>h", "<cmd>Alpha<cr>", desc = "Home", icon = "󰋜" },
			{
				"<leader>c",
				"<cmd>bwipeout<cr>",
				desc = "Close buffer",
				icon = { icon = "", color = "red" },
			},
			{ "<leader>q", "<cmd>q!<cr>", desc = "Quit", icon = "󰩈" },
			{ "<leader>w", "<cmd>w<cr>", desc = "Save", icon = "󰆓" },
			{ "<leader>x", "<cmd>x<cr>", desc = "Save & quit", icon = "󰗼" },
			{ "<leader>R", "<cmd>RunCode<cr>", desc = "Run code", icon = "" },
			{ "<leader>d", "<cmd>TroubleToggle<cr>", desc = "Diagnostics", icon = "" },
			{ "<leader>a", "<cmd>ASToggle<cr>", desc = "AutoSave toggle", icon = "󰿁" },
		})
	end,
}
