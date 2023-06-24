 <p align="Center">
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

# Keymaps
To go to see the keymaps click [here](keymaps_readme.md)

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

