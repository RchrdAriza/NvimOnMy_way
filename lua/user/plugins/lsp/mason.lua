return {
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
					"tsserver",
					"html",
					"cssls",
					"bashls",
					-- "tailwindcss",
					--       "svelte",
					--        "lua_ls",
					--        "graphql",
					-- "emmet_language_server",
					--        "prismals",
					"pyright",
				},
				-- auto-install configured servers (with lspconfig)
				automatic_installation = true, -- not the same as ensure_installed
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettierd", -- prettier formatter
					--        "stylua", -- lua formatter
					"autopep8", -- python formatter
					--       "black", -- python formatter
					--        "pylint", -- python linter
					"eslint_d", -- js linter
				},
			})
		end,
	},
}
