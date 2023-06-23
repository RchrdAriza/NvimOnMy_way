 < align="Center">
  <img src="https://res.cloudinary.com/dhqo7n9gd/image/upload/v1683993382/NvimOnMy_Way/NvimOnMyWay_jtlcp1.jpg" >
  <img src="https://img.shields.io/badge/-%3E=0.8.0-success?logo=neovim&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
  <img src="https://img.shields.io/badge/-Lua-success?logo=lua&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
  <img src="https://img.shields.io/badge/-Linux-success?logo=linux&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
  <img src="https://img.shields.io/badge/-Neovim-success?logo=neovim&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
  <img src="https://img.shields.io/badge/-vim-success?logo=vim&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
 </p>


- [Requirements](#requirements)
- [Installation](#installation)
- [Plugins](#Plugins)
- [Config](#Config)
  - [keymap](#keymap)
- [problems](#problems)
- [Captures](#captures)


# Requirements

- Python3
- pip
- Neovim 0.9.0
- NodeJS
- yarn
- lua

# Installation

Just run this in the terminal:

```bash 
git clone --depth=1 https://github.com/RchrdAlv/NvimOnMy_Way --branch=main ~/.config/nvim && nvim -c ":PackerInstall"; nvim -c ":lua InstallLSPs()"
```
# Plugins
- [Nvim-Tree](https://github.com/nvim-tree/nvim-tree.lua)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Nvim-Tresitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Autopair](https://github.com/windwp/nvim-autopairs)
- [Lualine-Nvim](https://github.com/nvim-lualine/lualine.nvim)
- [Bufferline](https://github.com/akinsho/bufferline.nvim)
- [Friendly-Snippets](https://github.com/rafamadriz/friendly-snippets)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Alpha](https://github.com/goolord/alpha-nvim)
 
 And some others...

# Config

## keymap

|Mode|  key | function | view |
|-------|-------------|---------|-------|
|Normal | \<space\>  | open Whickey menu | <img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1687547066/NvimOnMy_Way/Whickey_menu.jpg' width='400'/> |
|Normal | tab | Advance to the next tab | <img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1687548077/NvimOnMy_Way/Tab_key.jpg' width='400' /> 
|Normal| \<bs\> | Be moved one tab to the left | <img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1687548078/NvimOnMy_Way/bs_key.jpg' width='400' /> | 
| Normal | ctrl + x | Run code | <img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1687550697/NvimOnMy_Way/XRecorder_Edited_23062023_150115_arbksg.gif' width='400' /> |
| Normal | ctrl + t  | open float terminal | <img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1687548876/NvimOnMy_Way/terminal.jpg' width=300 /> |
|Normal| ctrl + c | Closes only the tab you are currently in | |
|Normal | ctrl + s | Save | <img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1687549855/NvimOnMy_Way/Save.jpg' width='400' /> |



## Problems
Sometimes when running the Plugins installer (Packer) an error occurs (mainly due to internet connection issues). The solution is simply to exit neovim, re-enter and run ":PackerInstall" and you are done.
This error only occurs when you run the installation command for the first time.

## Captures

<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1683989991/NvimOnMy_Way/Alpha.jpg.jpg' alt="inicio" width=320  >
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1683990002/NvimOnMy_Way/Python.jpg.jpg' alt="python" width=320>
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1683990014/NvimOnMy_Way/FileExplorer.jpg.jpg' alt="FileExplorer" width=320>
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1683990001/NvimOnMy_Way/OldFiles.jpg.jpg' alt="OldFiles" width=320>
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1683990003/NvimOnMy_Way/Whickey.jpg.jpg' alt="Whichkey" width=320>
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1683989991/NvimOnMy_Way/Bash.jpg.jpg' alt="Bash" width=320>

