return {
	-- ===== lspconfig =====
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = { hint_enable = false },
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local diag_float_group = vim.api.nvim_create_augroup("LspDiagnosticsFloat", { clear = false })

			-- Diagnósticos
			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
				update_in_insert = false,
				severity_sort = false,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = " ",
					},
					linehl = {
						[vim.diagnostic.severity.ERROR] = "Error",
						[vim.diagnostic.severity.WARN] = "Warn",
						[vim.diagnostic.severity.INFO] = "Info",
						[vim.diagnostic.severity.HINT] = "Hint",
					},
				},
			})

			--
			-- --
			-- Capabilities
			local capabilities = cmp_nvim_lsp.default_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			vim.lsp.config("*", {
				capabilities = capabilities,
				on_attach = function(_, bufnr)
					vim.api.nvim_clear_autocmds({ group = diag_float_group, buffer = bufnr })
					vim.api.nvim_create_autocmd("CursorHold", {
						group = diag_float_group,
						buffer = bufnr,
						callback = function()
							vim.diagnostic.open_float(nil, {
								focusable = false,
								close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
								border = "rounded",
								source = "always",
								prefix = " ",
								scope = "cursor",
							})
						end,
					})
				end,
			})

			-- Config específica de lua_ls
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.enable({
				"lua_ls",
				"pyright",
				"bashls"
			})
		end,
	},

	-- ===== mason =====
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local mason = require("mason")

			-- import mason-lspconfig
			local mason_lspconfig = require("mason-lspconfig")

			local mason_tool_installer = require("mason-tool-installer")

			-- enable mason and configure icons
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
					border = "rounded",
				},
			})

			mason_lspconfig.setup({
				-- list of servers for mason to install
				ensure_installed = {
					"ts_ls",
					-- "html",
					-- "cssls",
					"bashls",
					-- "tailwindcss",
					--  "svelte",
					"lua_ls",
					--        "graphql",
					-- "emmet_language_server",
					--        "prismals",
					"gopls",
					"pyright",
				},
				-- auto-install configured servers (with lspconfig)
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettierd", -- prettier formatter
					--        "stylua", -- lua formatter
					"autopep8", -- python formatter
					--       "black", -- python formatter
					--        "pylint", -- python linter
					"golangci_lint_ls",
					"eslint_d", -- js linter
					"beautysh" -- bash formatter
				},
			})
		end,
	},
}
