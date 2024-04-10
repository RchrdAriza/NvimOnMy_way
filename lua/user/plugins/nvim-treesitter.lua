return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-ts-rainbow2",
	},
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

			sync_install = false,

			auto_install = true,

			ignore_install = { "javascript" },

			highlight = {
				enable = true,

				-- disable = { "c", "rust" },
				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,

				additional_vim_regex_highlighting = true,
			},
			-- indent = { enable = true },
			rainbow = { enable = false },
		})
	end,
	{
		"m-demare/hlargs.nvim",
		config = function()
			require("hlargs").setup()
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			-- This module contains a number of default definitions
			local rainbow_delimiters = require("rainbow-delimiters")

			---@type rainbow_delimiters.config
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				priority = {
					[""] = 110,
					lua = 210,
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
	},
	{
		"yioneko/nvim-yati",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				yati = {
					enable = true,
					-- Disable by languages, see `Supported languages`
					disable = { "python" },

					-- Whether to enable lazy mode (recommend to enable this if bad indent happens frequently)
					default_lazy = true,

					-- Determine the fallback method used when we cannot calculate indent by tree-sitter
					--   "auto": fallback to vim auto indent
					--   "asis": use current indent as-is
					--   "cindent": see `:h cindent()`
					-- Or a custom function return the final indent result.
					default_fallback = "auto",
				},
				indent = {
					enable = false, -- disable builtin indent module
				},
			})
		end,
	},
}
