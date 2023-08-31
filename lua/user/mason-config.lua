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
    ensure_installed = {'pyright', 'html', 'cssls', 'bashls', 'tsserver', 'emmet_ls', 'tailwindcss' },
    -- automatic_installation = true
}
