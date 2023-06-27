require("mason").setup({
    ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
})

require("mason-lspconfig").setup{
    ensure_installed = { "lua_ls", "rust_analyzer", 'pyright', 'html', 'cssls', 'bashls', 'tsserver'
  },
│   automatic_installation = true
}

function InstallLSPs()
     local servers = {"pyright", "bash-language-server", "html-lsp", "css-lsp", "typescript-language-server", "vim-language-server"}
     for _, server in pairs(servers) do
          vim.cmd("MasonInstall " .. server)
      end
 end
