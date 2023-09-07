  require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
    end
  }
  require('lspconfig')['bashls'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
    end
  }
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        vim.lsp.log_set_level(vim.log.levels.OFF)
    end
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

  require'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        vim.lsp.log_set_level(vim.log.levels.OFF)
    end
  }
  require('lspconfig')['cssls'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        vim.lsp.log_set_level(vim.log.levels.OFF)
    end
  }
  require('lspconfig')['vimls'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        vim.lsp.log_set_level(vim.log.levels.OFF)
    end
  }

  require('lspconfig')['html'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        vim.lsp.log_set_level(vim.log.levels.OFF)
    end
  }
    require('lspconfig')['emmet_ls'].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = lsp_flags,
      -- on_attach = function(client, bufnr)
      --   vim.lsp.log_set_level(vim.log.levels.OFF)
      -- end
    }
  
  require('lspconfig')['tailwindcss'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        vim.lsp.log_set_level(vim.log.levels.OFF)
    end
  }

  require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({

  -- ... Your other configuration ...

  mapping = {

    -- ... Your other mappings ...

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
      -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    -- ... Your other mappings ...
  },

  -- ... Your other configuration ...
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })



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
