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
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			--                { "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			-- import lspconfig plugin
			local lspconfig = require("lspconfig")

			local navic = require("nvim-navic")

			-- import cmp-nvim-lsp plugin
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local lsp_zero = require("lsp-zero")

			lsp_zero.on_attach(function(_, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require("flutter-tools").setup({
				lsp = {
					capabilities = lsp_zero.get_capabilities(),
				},
			})

			local keymap = vim.keymap -- for conciseness

			local opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
				opts.buffer = bufnr
			end

			-- used to enable autocompletion (assign to every lsp server config)
			-- local capabilities = cmp_nvim_lsp.default_capabilities()
			-- local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

			-- Change the Diagnostic symbols in the sign column (gutter)
			-- (not in youtube nvim video)
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- configure html server
			lspconfig["html"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["eslint"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["volar"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure typescript server with plugin
			lspconfig["tsserver"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure css server
			lspconfig["cssls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure emmet language server
			-- lspconfig["emmet_language_server"].setup({
			-- 	filetypes = {
			-- 		"css",
			-- 		"eruby",
			-- 		"html",
			-- 		"javascript",
			-- 		"javascriptreact",
			-- 		"less",
			-- 		"sass",
			-- 		"scss",
			-- 		"svelte",
			-- 		"pug",
			-- 		"typescriptreact",
			-- 		"vue",
			-- 	},
			-- 	on_attach = on_attach,
			-- 	capabilities = capabilities,
			-- 	on_attach = function()
			-- 		vim.lsp.log_set_level(vim.log.levels.OFF)
			-- 	end,
			-- })

			-- configure python server
			lspconfig["pyright"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["tailwindcss"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure lua server (with special settings)
			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
		end,
	},
}
