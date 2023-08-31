local lsp_zero = require('lsp-zero')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()




local navic = require("nvim-navic")

-- Set up nvim-cmp.
local cmp = require'cmp'
  local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["luasnip"](args.body) -- For `vsnip` users.
           require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },

    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.sort_text,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    view = {
  entries = {name = 'custom', selection_order = 'near_cursor' }
},
    mapping = cmp.mapping.preset.insert({
      -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      -- { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For LuaSnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
      { name = 'path' },
    }),
    ------------------------
    
    formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end
  },
    ------------------------
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
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
        lsp_zero.default_keymaps({buffer = bufnr})
    end
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

  require'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
    end
  }
  require('lspconfig')['cssls'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
    end
  }
  require('lspconfig')['vimls'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
    end
  }

  require('lspconfig')['html'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
    end
  }
    require('lspconfig')['emmet_ls'].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = lsp_flags,
      -- on_attach = function(client, bufnr)
      --     navic.attach(client, bufnr)
      --   lsp_zero.default_keymaps({buffer = bufnr})
      -- end
    }
  
  require('lspconfig')['tailwindcss'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
    end
  }

  -- require('lspconfig')['clangd'].setup {
  --   capabilities = capabilities,
  --   on_attach = function(client, bufnr)
  --       navic.attach(client, bufnr)
  --   end
  -- }

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
