require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "autopep8" },
		-- Use a sub-list to run only the first available formatter
		javascript = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
		javascriptreact = { "prettierd" },
		markdown = { "prettierd" },
		django = { "djlint" },
		htmldjango = { "djlint" },
	},
})

local slow_format_filetypes = {}
require("conform").setup({
	format_on_save = function(bufnr)
		if slow_format_filetypes[vim.bo[bufnr].filetype] then
			return
		end
		local function on_format(err)
			if err and err:match("timeout$") then
				slow_format_filetypes[vim.bo[bufnr].filetype] = true
			end
		end

		return { timeout_ms = 200, lsp_fallback = true }, on_format
	end,

	format_after_save = function(bufnr)
		if not slow_format_filetypes[vim.bo[bufnr].filetype] then
			return
		end
		return { lsp_fallback = true }
	end,
})
