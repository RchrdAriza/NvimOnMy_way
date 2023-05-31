local wk = require("which-key")

wk.register({
  ["<leader><Space>"] = { "<cmd>Telescope find_files<cr>", "Find files" },
  ["<leader>e"] = { "<cmd>NvimTreeOpen<cr>", "File Explorer" },
  ["<leader>n"] = { "<cmd>enew<cr>", "New file" },
  ["<leader>r"] = { "<cmd>Telescope oldfiles<cr>", "Open recent files" },
  ["<leader>m"] = { "<cmd>Alpha<cr>", "Go to menu" },
--  ["<leader>t"] = { "<cmd>ToggleTerm<cr>", "terminal" },
  ["<leader>q"] = { "<cmd>q!<cr>", "Exit without saving" },
  ["<leader>x"] = { "<cmd>x<cr>", "Exit and save" },
  ["<leader>R"] = { "<cmd>RunCode<cr>", "Run Code" },
   
  -- Otras opciones...

})

wk.register({
  ["<leader>g"] = {
    name = "Git",
    a = { "<cmd>Gwrite<cr>", "Git Add [this file]" },
    s = { "<cmd>G<cr>", "Git Status" },
    c = { "<cmd>Git commit<cr>", "Git Commit" },
    d = { "<cmd>DiffviewOpen<cr>", "Git Diff" },
  },
})

wk.register({
  ["<leader>t"] = {
    name = "Terminal",
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal term"},
    f = { "<cmd>ToggleTerm direction=float<cr>", "Floating terminal"},
    t = { "<cmd>ToggleTerm direction=tab<cr>", "Tab terminal"},
    v = { "<cmd>ToggleTerm size=50 direction=vertical<cr>", "Vertical term"},
  },
})
