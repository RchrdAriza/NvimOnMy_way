
-- auto-save
vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})

-- terminal
require("toggleterm").setup{
    size = 20,
  open_mapping = [[<c-\>]],

  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
  border = "curved",
  winblend = 0,
  highlights = {
   border = "Normal",
   background = "Normal",
  },
 },
}


vim.cmd [[
" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
]]


require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

require('code_runner').setup {
  -- choose default mode (valid term, tab, float, toggle)
  mode = 'term',
  -- Focus on runner window(only works on toggle, term and tab mode)
  focus = true,
  -- startinsert (see ':h inserting-ex')
  startinsert = false,
  term = {
    --  Position to open the terminal, this option is ignored if mode is tab
    position = "bot",
    -- window size, this option is ignored if tab is true
    size = 8,
  },
  float = {
    -- Key that close the code_runner floating window
    close_key = '<ESC>',
    -- Window border (see ':h nvim_open_win')
    border = "none",

    -- Num from `0 - 1` for measurements
    height = 0.8,
    width = 0.8,
    x = 0.5,
    y = 0.5,

    -- Highlight group for floating window/border (see ':h winhl')
    border_hl = "FloatBorder",
    float_hl = "Normal",

    -- Transparency (see ':h winblend')
    blend = 0,
  },
  filetype_path = "", -- No default path defined
  before_run_filetype = function()
    vim.cmd(":w")
  end,
  filetype = {
    javascript = "node",
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    c = {
      "cd $dir &&",
      "gcc $fileName",
      "-o $fileNameWithoutExt &&",
      "$dir/$fileNameWithoutExt"
    },
    cpp = {
      "cd $dir &&",
      "g++ $fileName",
      "-o $fileNameWithoutExt &&",
      "$dir/$fileNameWithoutExt"
    },
    python = "python3 -u",
    sh = "bash",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
  },
  project_path = "", -- No default path defined
  project = {},
}


local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')


npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})

local ts_conds = require('nvim-autopairs.ts-conds')


-- press % => %% only while inside a comment or string
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
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

