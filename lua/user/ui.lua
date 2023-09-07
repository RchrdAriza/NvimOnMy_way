--  ╓──────────────────────────────────────────────────────────╖
--  ║                         Content                          ║
--  ╙──────────────────────────────────────────────────────────╜

--  ╭──────────────────────────────────────────────────────────╮
--  │                Plugins               type                │
--  │        which-key             [ ui | keybinding ]         │
--  │          Alpha                 [ ui | greeter ]          │
--  ╰──────────────────────────────────────────────────────────╯



local presets = require("which-key.plugins.presets")
presets.operators["v"] = nil
presets.operators["g"] = nil

local wk = require("which-key")

wk.setup({
      window = {
        border = "double", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
        winblend = 15, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000, -- positive value to position WhichKey above other floating windows.
      },

      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "-", -- symbol used between a key and it's label
        group = "", -- symbol prepended to a group
      },
    })

wk.register({
  ["<Space>f"] = { "<cmd>Telescope find_files<cr>", " Find files" },
  ["<Space>e"] = { "<cmd>Neotree<cr>", " File Explorer" },
  ["<Space>n"] = { "<cmd>enew<cr>", " New file" },
  ["<Space>r"] = { "<cmd>Telescope oldfiles<cr>", "󰷊 Open recent files" },
  ["<Space>h"] = { "<cmd>Alpha<cr>", " Go to menu" },
  ["<Space>q"] = { "<cmd>q!<cr>", " Exit" },
  ["<Space>x"] = { "<cmd>x<cr>", "󰗼 Exit and save" },
  ["<Space>R"] = { "<cmd>RunCode<cr>", " Run Code" },
  -- ["<Space>d"] = { "<cmd>AerialToggle!<cr>", " See details" },
  ["<Space>a"] = { "<cmd>ASToggle<cr>", " AutoSave On/Off" },
  ["<Space>c"] = { "<cmd>:lua countAndCloseBuffers()<cr>", "󱎘 Close tab" },

})

wk.register({
  ["<Space>d"] = {
    name = " See details",
    e = { "<cmd>TroubleToggle<cr>", "See errors" },
    f = { "<cmd>AerialToggle!<cr>", "See functions"}
  },
})
wk.register({
  ["<Space>m"] = {
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

local alpha = require("alpha") 
local dashboard = require("alpha.themes.dashboard") 
local time = os.date("%H:%M")
local date = os.date("%a %d %b")
local v = vim.version()
local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch
dashboard.section.header.val = {
    '       ███╗░░██╗██╗░░░██╗██╗███╗░░░███╗', 
    '       ████╗░██║██║░░░██║██║████╗░████║',
    '       ██╔██╗██║╚██╗░██╔╝██║██╔████╔██║',
    '       ██║╚████║░╚████╔╝░██║██║╚██╔╝██║', 
    '       ██║░╚███║░░╚██╔╝░░██║██║░╚═╝░██║', 
    '       ╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝', 
    '', 
    '  	     █▀█ █▄░█  █▀▄▀█ █▄█	    ', 
    '	     █▄█ █░▀█  █░▀░█ ░█░	    ', 
    '',
    '       ░██╗░░░░░░░██╗░█████╗░██╗░░░██╗', 
    '       ░██║░░██╗░░██║██╔══██╗╚██╗░██╔╝', 
    '       ░╚██╗████╗██╔╝███████║░╚████╔╝░', 
    '       ░░████╔═████║░██╔══██║░░╚██╔╝░░', 
    '       ░░╚██╔╝░╚██╔╝░██║░░██║░░░██║░░░', 
    '       ░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝░░░╚═╝░░░',
}
-- dashboard.section.header.val = { 
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠓⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠎⠁⠀⢺⣤⡀⠀⠀⠀⠀⠀⠀⠀⢄⣀⣀⣀⠀⠐⣂⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠉⠀⠀⠀⠀⠈⣿⣿⣿⣷⣦⣤⣴⣛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣤⣀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⣠⠚⠁⠀⠀⠀⠀⠀⠀⣀⣘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣌⠳⣄⠀⠀⠀⠀⠀⣠',
-- '⠀⠀⠀⠀⠀⢠⠞⠁⠀⠀⢀⣠⣴⣶⣾⣿⣿⣿⣿⣿⡏⠉⠛⢿⣿⣿⣿⣿⡝⢿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⡀⠀⠀⣠⠐⠀⠀⠀⠘⢦⢈⠳⡀⠀⢠⠞⠁',
-- '⠀⠀⠀⢀⡴⠋⢀⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⠏⢹⣿⠁⠀⠀⠀⠙⢿⣿⣿⣿⡄⠻⣿⣷⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⠢⠐⠎⢄⢢⠘⡤⡈⢢⡳⠳⡱⣤⠏⠀⠀',
-- '⠀⠀⢠⠟⠁⠀⠁⠀⠀⢀⣤⣶⣿⣿⣿⣿⠃⠀⢸⡧⠀⠀⠀⠀⠀⠀⠻⣿⣿⣷⠀⠈⢿⣷⡄⠙⢿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⢯⣣⠘⢎⢆⠱⡁⣿⠏⠀⠀⠀',
-- '⠀⢠⠏⠀⣀⣀⣠⣤⣾⠿⣿⣿⣿⣿⣿⠇⠀⠀⠘⣿⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣇⠀⠀⢙⣿⡄⠀⠙⢿⣿⣿⣿⡆⠹⣿⣿⣿⣿⣿⣿⣿⣧⡁⠀⢳⡳⡜⢮⡳⣘⡟⠀⠀⠀⠀',
-- '⢀⡏⠀⠀⠀⠀⠈⠀⢠⣾⣿⣿⣿⣿⡿⠀⠀⠀⠀⢿⡆⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⡤⠞⠉⠈⠻⡄⠀⠈⠻⣿⣿⡇⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠱⡕⡄⢳⣹⠃⠀⠀⠀⠀',
-- '⡞⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠘⣇⠀⠀⠀⠀⠀⠀⠀⢀⡼⢻⡇⠀⣠⣤⠤⠼⠤⣄⠀⠘⢿⡇⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⡀⢵⠹⡄⣿⠀⠀⠀⠀⠀',
-- '⡆⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⡦⠀⠀⠀⠀⢀⡴⠋⠀⢀⡵⠋⠁⠀⠀⠀⠀⠀⠙⠳⠴⠃⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⡀⠸⣄⢹⡏⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⠇⠀⠀⡞⠀⠸⣿⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⢻⣿⣿⣿⣿⣿⣿⣷⡰⡀⢼⡇⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⣿⡿⠏⣸⣿⣿⣿⣿⣿⡄⠀⠀⣀⣠⠤⠤⢤⣀⡀⠀⠀⠀⠀⠀⠸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡖⡀⢀⡴⠀⠀⠘⠀⢹⣿⣿⣿⣿⣿⡿⣧⠇⢸⡇⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⢠⣿⠁⠀⣿⣿⣿⣿⣿⣿⣷⠒⠉⠁⣠⡤⠤⠤⣬⡙⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⢏⣠⠕⠛⠀⠀⠀⠀⠀⠀⣿⣿⡿⠋⣉⡛⢮⡏⢸⠁⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠸⠁⠀⢠⣿⣿⣿⣿⣿⡏⠻⡄⢠⠎⠁⢠⣶⡤⠀⠉⢸⠇⠀⠀⠀⠀⠀⠐⠢⠤⣤⡤⠔⠺⠟⣚⣩⣥⠥⣶⠦⣤⠀⠀⠀⠀⣾⡟⣠⠋⠀⢹⡌⡇⢸⠀⠀⠀⠀⠀⠀',
-- '⢇⠀⠀⠀⠀⠀⠀⣼⣿⣿⠟⣿⣿⣷⡀⠀⠸⡀⠀⠈⠉⠀⠀⠀⡞⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠤⠖⠊⠉⠀⠀⠀⢀⣧⢀⡏⠀⠀⠀⠀⣿⢱⠷⠶⠀⢸⠃⣾⢺⠀⠀⠀⠀⠀⠀',
-- '⠸⡄⠀⠀⠀⠀⣰⣿⠟⠁⠀⢹⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⣰⠻⣦⡔⠒⠀⣀⡤⠔⠚⠁⠀⢀⣀⣤⣴⣾⣿⣿⣿⣿⣿⠧⡄⠀⠀⢰⠃⣾⠋⠉⢹⠀⢠⢿⣾⡄⠀⠀⠀⠀⠀',
-- '⠀⢷⡀⠀⠀⠾⠋⠁⠀⢀⠀⢸⣿⣿⣿⣿⣧⡀⠀⠤⠤⠖⠋⠁⠀⠀⣠⠴⠊⠁⠀⣀⣤⣴⣾⣿⣿⣿⡿⠿⠛⠛⠛⠛⡟⠀⡄⠀⢀⡏⠀⡼⢀⡰⠃⣰⣿⣿⣹⡇⠀⠀⠀⠀⠀',
-- '⠀⠈⢷⡰⠀⠀⠀⠀⠀⢠⠢⡱⣿⣟⢿⣿⣿⣷⡄⠀⠀⠀⠀⢀⡴⠚⠁⠀⣠⣴⣾⣿⣿⣿⣿⡿⠋⠁⠀⠀⠀⠀⠀⡴⠁⠀⠀⠀⡾⠓⠛⠛⢉⣴⣻⢧⣽⢽⢻⣇⠀⠀⠀⠀⠀',
-- '⠀⠀⠈⢳⡀⠀⢀⠰⡔⠈⠳⣙⣿⢎⠀⠙⣿⣿⣿⣆⠀⠀⢰⠋⠀⠀⢠⣾⣿⣿⣿⣿⣿⠟⠁⠀⠀⢀⣠⠤⠖⢚⡟⠁⠀⠀⣠⣾⠙⠲⡖⠊⣯⢢⢳⣿⣏⡶⠋⣿⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠹⣆⠀⠉⢙⣄⢦⡙⢦⡳⣄⠀⢊⠿⣿⣿⣧⠀⠈⠳⣄⣀⡜⢻⠿⡿⣿⡿⠁⣀⡤⠖⠊⠉⠀⣠⠴⠋⠀⠀⢀⣴⢿⣯⠁⠀⣿⡆⡞⡾⣞⡿⢋⢀⣰⠟⠀⠀⠀⠀⠀',
-- '⠀⡄⠀⢀⣀⡽⠷⢒⢿⡻⣓⠵⢤⡙⠎⠧⣄⢝⣻⡸⢻⣷⡀⠀⠈⠳⣶⣦⣴⣴⣿⠷⠋⠁⠀⠀⣀⡤⣞⠁⠀⠀⢀⣠⢾⣿⣾⡇⠀⠀⠘⢧⠶⠋⢉⣀⣈⣹⣷⡄⠀⠀⠀⠀⠀',
-- '⠀⠉⠉⠉⠀⠀⣰⠻⢤⣐⠈⠢⡑⢥⡉⡁⢬⣣⡍⠳⣌⠻⣽⣦⣄⡀⠈⠙⠛⠯⠤⠤⠴⠒⣒⠯⠟⠊⠁⠀⢀⣴⣿⣿⣿⣾⣿⠇⠀⠀⠀⠈⢑⣶⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⣴⠃⠀⠀⠉⠲⣤⡉⠲⢝⠪⣷⣌⡳⣕⢪⡉⠚⠯⠭⠽⡶⠦⣤⣤⣀⡀⠀⠀⠀⠀⠀⢀⣤⢾⣿⢷⢟⣿⣽⣣⡏⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⢰⠃⠀⠀⠀⠀⠀⠀⠙⠲⢤⣙⡺⡑⠍⠻⢝⠦⣱⠄⡀⠀⠨⠅⢺⣑⠮⡉⠉⠙⠲⡶⠻⣟⢿⣽⣻⣯⡿⡿⢻⠟⠀⠀⢀⡴⠊⣽⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠙⠒⠶⠾⠤⢭⣒⣈⣉⡡⠶⠴⠽⠷⠖⠋⠉⠙⢆⠘⠞⣿⢫⣎⡾⡿⠀⠀⢀⡰⠋⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠹⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡄⠘⠉⠋⠙⠈⠀⠀⣠⠏⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⢀⣨⣷⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣤⣇⣀⣀⠀⠀⠀⠀⠀⠁⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀',
-- '⠀⠀⠀⠀⠀⠹⡄⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⠟⠋⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢦⣀',
-- '⢀⠄⠂⠉⠉⠁⠚⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣴⣾⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠈',
-- '⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀',
-- '⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⣀⣀⣀⣀⣀⣀⣀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣀⠀⢀⣀⣀⣀⣀⣀⣀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢋⠀⣀⣀⣀⣀⡀',
-- } 
--
-- Set header
--dashboard.section.header.val = {
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠤⠖⠒⠒⠒⠒⠒⠦⠤⢤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡤⠒⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠓⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠞⠁⠀⠀⠔⡴⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀⣠⠄⡶⢀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠘⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠁⠀⠀⠀⣼⠁⢙⣀⣤⣧⣤⣤⣶⣶⣤⣤⣁⡁⠁⠠⢤⠀⠀⠀⠆⠀⠀⠀⠹⡄⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡞⠀⢀⣠⡤⠾⠛⠛⠛⠛⠛⠛⠋⠛⠛⠻⠿⣿⣿⣿⣿⣶⣦⣌⠛⠂⠀⠀⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠓⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⢿⣷⣦⡘⠂⠀⠀⠀⠈⣧⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⣠⡴⢊⣡⠄⠀⠀⠀⠀⠀⢀⣠⣴⣶⣶⣿⠋⢻⣿⣿⣶⣶⣤⣄⡀⠀⠀⠀⠀⠈⠙⢿⣦⡄⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⢀⣠⠚⢁⡴⠋⠀⠀⠀⠀⢀⣠⣾⣿⣿⠟⣿⣿⡏⠀⠀⠻⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠈⠛⢦⡀⠀⡾⠀⠀⠀⠀⠀⠀',
--'⠀⢀⡴⠋⠀⠀⠈⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⡏⠀⣿⣿⠁⠀⠀⠀⢹⣿⣿⣿⢻⣿⣿⣿⣿⣦⡀⢀⠀⠀⠀⠀⠙⢦⠇⠀⠀⠀⠀⠀⠀',
--'⢀⡞⠁⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⡟⠀⠀⣿⡿⠀⠀⠀⠀⠀⣿⣿⡟⠀⠻⣿⣿⣿⣿⣿⣦⠱⣌⠑⠀⠀⠈⠱⣄⠀⠀⠀⠀⠀',
--'⡾⠀⠀⠀⠀⠀⡶⠀⠀⢀⣿⣿⣿⣿⣿⡿⠀⠀⠀⢸⡇⠀⠀⠀⣷⡀⢸⣿⠁⠀⠀⢹⣿⣿⣿⣿⣿⣷⠀⠱⣄⢳⠀⠀⠈⢳⡀⠀⠀⠀',
--'⣇⠀⢀⠀⠀⠀⠃⠀⠀⢸⣿⣿⣿⡏⣿⡇⠀⠀⠀⠈⣧⠀⠀⠀⠉⠀⢀⡏⠀⠀⣀⡠⣿⡏⣿⣿⣿⣿⣷⡄⠨⡤⡄⠀⠀⠀⠹⣄⠀⠀',⠀
--'⠹⡄⠘⠀⢧⠹⣆⠸⡄⣾⣿⣿⣿⡇⢿⣇⡐⣶⣶⣴⠤⠀⠀⠀⠀⢀⠾⠶⢶⡿⠿⠶⣽⡇⣿⣿⣿⣿⣿⣷⠀⣈⠀⠀⠀⠀⠀⠘⡆⠀',
--'⠀⠱⣄⠀⢈⢣⡉⢀⣼⠟⣹⣿⣿⡇⠈⣧⠟⠁⡀⠈⠙⣆⠀⠀⠀⠀⠀⢰⠋⢀⣤⡀⠈⢷⣿⢿⣿⣿⣿⣿⡆⠸⡔⠶⠀⠀⠀⠀⢳⠀',
--'⠀⠀⠘⢦⣀⠓⢻⢉⢁⢠⡿⢹⣿⣇⠀⠈⠀⠸⣿⠇⠀⡈⣻⠀⠀⠀⠀⠀⠀⠘⠿⠋⠀⣠⠏⢸⣿⣿⣯⣿⡇⢰⢠⢀⠀⠀⠀⠀⢸⡇',
--'⠀⠀⠀⠀⠉⠳⣜⠉⠻⠋⠀⠘⣿⡹⣆⠀⠦⣀⣀⣀⡴⠋⣼⠀⠀⠀⠀⠈⠳⢤⣀⣠⠾⠃⠀⠼⣿⣎⣀⡿⡿⠃⠾⢿⠇⠀⠀⠀⣼⠁',
--'⠀⠀⠀⠀⠀⠀⠈⠉⠙⢧⣄⠀⠹⣷⣿⡀⠀⠀⠀⠀⠀⠀⠙⠶⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⡸⠈⣇⢾⡼⠱⡠⢀⠀⠀⠀⠀⣸⠃⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠲⢝⣦⡇⠀⠀⠐⢦⣀⣀⣀⣠⣤⠤⠤⣤⡖⠉⠀⠀⣦⠀⣰⣳⣛⡱⠋⠀⠘⠱⢫⣖⡠⠴⠚⠁⠀ ',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄⠀⠀⠞⠉⠀⣰⠃⣤⠀⠀⠀⠉⠳⣄⠀⢀⣼⣉⠩⠥⠤⠔⠒⠒⠚⠉⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⣤⡀⠀⠀⠃⠀⠈⠓⠀⠀⠀⢀⣠⠴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠲⡤⠤⠤⠤⠤⠖⠚⢻⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
--' ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⣿⠀⠀⠀⠀⠀⠀⠈⡷⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣷⡠⠏⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢴⣿⣿⣿⣿⣿⣿⡟⠓⢦⣀⣠⠴⠚⣻⣿⣿⣿⣿⣿⣿⡟⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠋⠈⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⡇⠀⠛⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠃⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢰⣄⠸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠃⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠁⠀⢻⡀⠀⠀⠀⠀⠀⠀⠀⠀',
--'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡃⠀⠀⠀⠸⡇⠀⠀⠀⠀⠀⠀⠀⠀',
--}

-- Set menu 
 dashboard.section.buttons.val = { 
     dashboard.button( "n", "   New file" , ":ene <BAR> startinsert <CR>"), 
     dashboard.button( "f", "󰮗   Find file", ":cd $HOME | Telescope find_files<CR>"), 
     dashboard.button( "e", "   File Explorer", ":cd $HOME | Neotree<CR>"), 
     dashboard.button( "r", "   Recent"   , ":Telescope oldfiles<CR>"), 
     dashboard.button( "c", "   Configuration", ":e ~/.config/nvim/lua/user/config.lua<CR>"), 
     dashboard.button( "R", "󱘞   Ripgrep", ":Telescope live_grep<CR>"), 
     dashboard.button( "q", "󰗼   Quit", ":qa<CR>"), 
 } 


function centerText(text, width)
  local totalPadding = width - #text
  local leftPadding = math.floor(totalPadding / 2)
  local rightPadding = totalPadding - leftPadding
  return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
end

dashboard.section.footer.val = {
    centerText("Kaizoku Ou Ni Ore Wa Naru", 50),
    " ",
    -- centerText("NvimOnMy_Way❤️", 50),
    -- " ",
    centerText(date, 50),
    centerText(time, 50),
    centerText(version, 50)
}



 alpha.setup(dashboard.opts) 
  

 vim.cmd([[ 
     autocmd FileType alpha setlocal nofoldenable 
 ]])
