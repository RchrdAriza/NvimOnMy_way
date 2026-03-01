return {
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {
			hint_enable = false,
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			-- { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {
			-- Your setup opts here
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			--                { "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			-- import lspconfig plugin
			-- local lspconfig = require("lspconfig") deprecated

			local navic = require("nvim-navic")

			-- import cmp-nvim-lsp plugin
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = false,
			})

			-- Iconos de diagnóstico en el gutter
			local signs = { Error = " ", Warn = "", Hint = "", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			vim.api.nvim_create_autocmd("CursorHold", {
				buffer = bufnr,
				callback = function()
					local opts = {
						focusable = false,
						close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
						border = "rounded",
						source = "always",
						prefix = " ",
						scope = "cursor",
					}
					vim.diagnostic.open_float(nil, opts)
				end,
			})

			local keymap = vim.keymap -- for conciseness

			local opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
				opts.buffer = bufnr
			end

			-- =============================================
			-- Capabilities (autocompletado con cmp)
			-- =============================================
			local capabilities = cmp_nvim_lsp.default_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			--	========================================
			vim.lsp.enable({
				"html",
				"lua_ls",
				-- 'ts_ls',          -- TypeScript/JavaScript
				-- 'eslint',         -- ESLint
				-- 'cssls',          -- CSS
				--"pyright", -- Python
				-- 'clangd',         -- C/C++
				-- 'bashls',         -- Bash
				-- 'vue_ls',         -- Vue (antes volar)
				-- 'emmet_language_server',
			})
		end,
	},
}
