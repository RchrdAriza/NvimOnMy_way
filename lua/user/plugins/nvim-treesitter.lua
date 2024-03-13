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

				disable = { "c", "rust" },
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,

				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		})
	end,
	{
		"m-demare/hlargs.nvim",
		config = function()
			require("hlargs").setup()
		end,
	},
	"HiPhish/nvim-ts-rainbow2",
	config = function()
		require("nvim-treesitter.configs").setup({
			rainbow = {
				enable = true,
				-- list of languages you want to disable the plugin for
				disable = { "jsx", "cpp" },
				-- Which query to use for finding delimiters
				query = "rainbow-parens",
				-- Highlight the entire buffer all at once
				strategy = require("ts-rainbow").strategy.global,
			},
		})
	end,
}
