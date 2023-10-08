--  ╓──────────────────────────────────────────────────────────╖
--  ║                         Content                          ║
--  ╙──────────────────────────────────────────────────────────╜


--  ╓──────────────────────────────────────────────────────────╖
--  ║                                                          ║
--  ║         --Plugin                          Type           ║
--  ║        --Telescope                      [Search]         ║
--  ║     --telescope-file-browser          [file_browser]     ║
--  ║      telescope-emoji                                     ║
--  ║                                                          ║
--  ╙──────────────────────────────────────────────────────────╜


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


  require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    emoji = {
      action = function(emoji)
        -- argument emoji is a table.
        -- {name="", value="", cagegory="", description=""}

        vim.fn.setreg("*", emoji.value)
        print([[Press p or "*p to paste this emoji]] .. emoji.value)

        -- insert emoji when picked
        -- vim.api.nvim_put({ emoji.value }, 'c', false, true)
      end,
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  }
}

require("telescope").load_extension "file_browser"

require("telescope").load_extension("emoji")

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "fb",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
