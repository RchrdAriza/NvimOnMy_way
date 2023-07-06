
local presets = require("which-key.plugins.presets")
presets.operators["v"] = nil
presets.operators["g"] = nil

local wk = require("which-key")

wk.register({
  ["<Space>f"] = { "<cmd>Telescope find_files<cr>", " Find files" },
  ["<Space>e"] = { "<cmd>Neotree<cr>", " File Explorer" },
  ["<Space>n"] = { "<cmd>enew<cr>", " New file" },
  ["<Space>r"] = { "<cmd>Telescope oldfiles<cr>", "󰷊 Open recent files" },
  ["<Space>m"] = { "<cmd>Alpha<cr>", " Go to menu" },
  ["<Space>q"] = { "<cmd>q!<cr>", " Exit" },
  ["<Space>x"] = { "<cmd>x<cr>", "󰗼 Exit and save" },
  ["<Space>R"] = { "<cmd>RunCode<cr>", " Run Code" },
  -- ["<Space>d"] = { "<cmd>AerialToggle!<cr>", " See details" },
  ["<Space>a"] = { "<cmd>ASToggle<cr>", " AutoSave On/Off" },
  ["<Space>h"] = { "<cmd>:lua hightlight()<cr>", " HighLight" },
  ["<Space>c"] = { "<cmd>:lua close_tab()<cr>", "󱎘 Close tab" },
   
  -- Otras opciones...

})

wk.register({
  ["<Space>d"] = {
    name = " See details",
    e = { "<cmd>TroubleToggle<cr>", "See errors" },
    f = { "<cmd>AerialToggle!<cr>", "See functions"}
  },
})
wk.register({
  ["<Space>M"] = {
    name = " Markdown",
    l = { "<cmd>lua start_grip()<cr>", "Start grip" },
    s = { "<cmd>lua stop()<cr>", "Stop grip"}
  },
})
wk.register({
  ["<Space>w"] = {
    name = " Web development",
    l = { "<cmd>lua live_server()<cr>", "Start live server" },
    s = { "<cmd>lua stop_live_server()<cr>", "Stop live server"}
  },
})

wk.register({
  ["<Space>g"] = {
    name = "󰊢 Git",
    a = { "<cmd>Gwrite<cr>", "Git Add [this file]" },
    s = { "<cmd>Neotree float git_status<cr>", "Git Status" },
    c = { "<cmd>Git commit<cr>", "Git Commit" },
    d = { "<cmd>DiffviewOpen<cr>", "Git Diff" },
  },
})

wk.register({
  ["<Space>t"] = {
    name = " Terminal",
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal term"},
    f = { "<cmd>ToggleTerm direction=float<cr>", "Floating terminal"},
    t = { "<cmd>ToggleTerm direction=tab<cr>", "Tab terminal"},
    v = { "<cmd>ToggleTerm size=50 direction=vertical<cr>", "Vertical term"},
  },
})
