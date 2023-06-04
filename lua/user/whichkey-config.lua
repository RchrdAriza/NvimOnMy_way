local wk = require("which-key")

wk.register({
  ["<Space>f"] = { "<cmd>Telescope find_files<cr>", "Find files" },
  ["<Space>e"] = { "<cmd>NvimTreeOpen<cr>", "File Explorer" },
  ["<Space>n"] = { "<cmd>enew<cr>", "New file" },
  ["<Space>r"] = { "<cmd>Telescope oldfiles<cr>", "Open recent files" },
  ["<Space>m"] = { "<cmd>Alpha<cr>", "Go to menu" },
  ["<Space>q"] = { "<cmd>q!<cr>", "Exit without saving" },
  ["<Space>x"] = { "<cmd>x<cr>", "Exit and save" },
  ["<Space>R"] = { "<cmd>RunCode<cr>", "Run Code" },
  ["<Space>a"] = { "<cmd>AerialToggle!<cr>", "See details" },
   
  -- Otras opciones...

})

wk.register({
  ["<Space>g"] = {
    name = "Git",
    a = { "<cmd>Gwrite<cr>", "Git Add [this file]" },
    s = { "<cmd>G<cr>", "Git Status" },
    c = { "<cmd>Git commit<cr>", "Git Commit" },
    d = { "<cmd>DiffviewOpen<cr>", "Git Diff" },
  },
})

wk.register({
  ["<Space>t"] = {
    name = "Terminal",
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal term"},
    f = { "<cmd>ToggleTerm direction=float<cr>", "Floating terminal"},
    t = { "<cmd>ToggleTerm direction=tab<cr>", "Tab terminal"},
    v = { "<cmd>ToggleTerm size=50 direction=vertical<cr>", "Vertical term"},
  },
})
