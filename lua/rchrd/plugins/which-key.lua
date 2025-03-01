return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>t", group = "telescope", icon = "" },
			{ "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find file", mode = "n" },
			{ "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "live_grep" },
			{ "<cmd>Telescope live_grep<cr>", desc = "live_grep" },
			{ "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>tb", "<cmd>Telescope help_tags<cr>", desc = "Help_tags" },

			-------------------
			{ "<leader>l", group = "Lsp Actions", icon = "" },
			{ "<leader>lD", "<cmd>:lua vim.lsp.buf.declaration()<cr>", desc = "lsp.buf.declaration" },
			{ "<leader>ld", "<cmd>:lua vim.lsp.buf.definition()<cr>", desc = "vim.lsp.buf.definition" },
			{ "<leader>lh", "<cmd>:lua vim.lsp.buf.hover()<cr>", desc = "lsp.buf.hover" },
			{ "<leader>li", "<cmd>:lua vim.lsp.buf.implementation()<cr>", desc = "lsp.buf.implementation" },
			{ "<leader>lr", "<cmd>:lua vim.lsp.buf.rename()<cr>", desc = "lsp.buf.rename" },
			{ "<leader>la", "<cmd>:lua vim.lsp.buf.code_action()<cr>", desc = "lsp.buf.code_action" },
			{ "<leader>le", "<cmd>:lua vim.diagnostic.open_float()<cr>", desc = "vim.diagnostic" },
			{ "<leader>lt", "<cmd>:lua vim.lsp.buf.type_definition()<cr>", desc = "lsp.buf.type_definition" },
			{ "<leader>lR", "<cmd>:lua vim.lsp.buf.references()<cr>", desc = "lsp.buf.references" },
			{ "<leader>ls", "<cmd>:lua vim.lsp.signature_help()<cr>", desc = "lsp.buf.references" },

			---------------------
			{ "<leader>g", group = "Git" },
			{ "<leader>ga", "<cmd>Gwrite<cr>", desc = "Git Add [this file]" },
			{ "<leader>gs", "<cmd>Neotree float git_status<cr>", desc = "Git Status" },
			{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git Commit" },
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff" },
			---------------------

			{ "<leader>x", group = "Terminal", icon = "" },
			{ "<Space>xh", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal term" },
			{ "<leader>xf", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating terminal" },
			{ "<leader>xt", "<cmd>ToggleTerm direction=tab<cr>", desc = "Tab terminal" },
			{ "<leader>xv", "<cmd>ToggleTerm size=50 direction=vertical<cr>", desc = "Vertical term" },
		})
	end,
	keys = {
		{ "<leader><Space>", "<cmd>noh<cr>", desc = "Noh" },
		{ "<leader>e", "<cmd>Neotree<cr>", desc = "File Explorer" },
		{ "<leader>n", "<cmd>enew<cr>", desc = "New file" },
		{ "<leader>r", "<cmd>Telescope oldfiles<cr>", desc = "Open recent files" },
		{ "<leader>h", "<cmd>Alpha<cr>", desc = "home" },
		{ "<leader>c", "<cmd>:bwipeout<cr>", desc = "Close tab ()" },
		{ "<leader>q", "<cmd>q!<cr>", desc = "Exit" },
		{ "<leader>x", "<cmd>x<cr>", desc = "Exit and save" },
		{ "<leader>R", "<cmd>RunCode<cr>", desc = "Run Code" },
		{ "<leader>d", "<cmd>TroubleToggle<cr>", desc = "See all errors" },
		{ "<leader>a", "<cmd>ASToggle<cr>", desc = "AutoSave On/Off" },
	},
}
