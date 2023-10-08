-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    python = {
      require("formatter.filetypes.python").autopep8,
    },

    html = {
      require("formatter.filetypes.html").prettierd,
    },

    css = {
      require("formatter.filetypes.css").prettierd,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettierd,
    },
    markdown = {
      require("formatter.filetypes.markdown").prettierd,
    },
    -- lua = {
    --   require("formatter.filetypes.lua").stylua,
    -- },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace,
    }
  }
}

