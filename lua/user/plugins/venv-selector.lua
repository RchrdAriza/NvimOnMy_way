return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    { "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
  },
  ft = "python",                                                                                    -- Load when opening Python files
  keys = { { ",v", "<cmd>VenvSelect<cr>" } },                                                       -- Open picker on keymap
  opts = {
    options = {},                                                                                   -- plugin-wide options
    search = {}                                                                                     -- custom search definitions
  },
}
