return {
	-- ===== init.lua (ReplaceWithRegister) =====
	"inkarkat/vim-ReplaceWithRegister",

	-- ===== autosave.lua =====
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({
				enabled = false, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
				execution_message = {
					message = function() -- message to print on save
						return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
					end,
					dim = 0.18,                  -- dim the color of `message`
					cleaning_interval = 1250,    -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
				},
				trigger_events = { "TextChanged" }, -- vim events that trigger auto-save. See :h events
				-- function that determines whether to save the current buffer or not
				-- return true: if buffer is ok to be saved
				-- return false: if it's not ok to be saved
				condition = function(buf)
					local fn = vim.fn
					local utils = require("auto-save.utils.data")

					if
							fn.getbufvar(buf, "&modifiable") == 1
							and utils.not_in(fn.getbufvar(buf, "&filetype"), { "dart" })
					then
						return true          -- met condition(s), can save
					end
					return false           -- can't save
				end,
				write_all_buffers = false, -- write all buffers when the current one meets `condition`
				debounce_delay = 135,    -- saves the file at most every `debounce_delay` milliseconds
				callbacks = {            -- functions to be executed at different intervals
					enabling = nil,        -- ran when enabling auto-save
					disabling = nil,       -- ran when disabling auto-save
					before_asserting_save = nil, -- ran before checking `condition`
					before_saving = nil,   -- ran before doing the actual save
					after_saving = nil,    -- ran after doing the actual save
				},
			})
		end,
	},

	-- ===== coderunner.lua =====
	{ "CRAG666/code_runner.nvim", config = true },

	-- ===== colorizer.lua =====
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {},
	},

	-- ===== comment.lua =====
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},

	-- ===== indent.lua =====
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},

	-- ===== surround.lua =====
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- ===== trouble.lua =====
	{
		"folke/trouble.nvim",
		dependencies = { "RchrdAriza/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- ===== ufo.lua =====
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		opts = {
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("local_detach_ufo", { clear = true }),
				pattern = opts.filetype_exclude,
				callback = function()
					require("ufo").detach()
				end,
			})

			vim.opt.foldlevelstart = 99
			require("ufo").setup(opts)
		end,
	},

	-- ===== which-key.lua =====
	{
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
	},

	-- ===== yanky.lua =====
	{
		"gbprod/yanky.nvim",
		dependencies = {
			{ "kkharji/sqlite.lua" },
		},
		opts = {
			ring = { storage = "sqlite" },
		},
		keys = {
			{
				"<leader>p",
				function()
					require("telescope").extensions.yank_history.yank_history({})
				end,
				desc = "Open Yank History",
			},
			{ "y",     "<Plug>(YankyYank)",                      mode = { "n", "x" },                                desc = "Yank text" },
			{ "p",     "<Plug>(YankyPutAfter)",                  mode = { "n", "x" },                                desc = "Put yanked text after cursor" },
			{ "P",     "<Plug>(YankyPutBefore)",                 mode = { "n", "x" },                                desc = "Put yanked text before cursor" },
			{ "gp",    "<Plug>(YankyGPutAfter)",                 mode = { "n", "x" },                                desc = "Put yanked text after selection" },
			{ "gP",    "<Plug>(YankyGPutBefore)",                mode = { "n", "x" },                                desc = "Put yanked text before selection" },
			{ "<c-p>", "<Plug>(YankyPreviousEntry)",             desc = "Select previous entry through yank history" },
			{ "<c-n>", "<Plug>(YankyNextEntry)",                 desc = "Select next entry through yank history" },
			{ "]p",    "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put indented after cursor (linewise)" },
			{ "[p",    "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put indented before cursor (linewise)" },
			{ "]P",    "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put indented after cursor (linewise)" },
			{ "[P",    "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put indented before cursor (linewise)" },
			{ ">p",    "<Plug>(YankyPutIndentAfterShiftRight)",  desc = "Put and indent right" },
			{ "<p",    "<Plug>(YankyPutIndentAfterShiftLeft)",   desc = "Put and indent left" },
			{ ">P",    "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
			{ "<P",    "<Plug>(YankyPutIndentBeforeShiftLeft)",  desc = "Put before and indent left" },
			{ "=p",    "<Plug>(YankyPutAfterFilter)",            desc = "Put after applying a filter" },
			{ "=P",    "<Plug>(YankyPutBeforeFilter)",           desc = "Put before applying a filter" },
		},
	},

	-- ===== vim_navigator.lua =====
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	-- ===== hlslens.lua =====
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup()

			local kopts = { noremap = true, silent = true }

			vim.api.nvim_set_keymap(
				"n",
				"n",
				[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts
			)
			vim.api.nvim_set_keymap(
				"n",
				"N",
				[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts
			)
			vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
		end,
	},

}
