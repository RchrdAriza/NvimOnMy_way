 <p align="Center">
  <img src="https://res.cloudinary.com/dhqo7n9gd/image/upload/v1693760235/Nvim/Head.jpg" >
  <img src="https://img.shields.io/badge/-%3E=0.8.0-success?logo=neovim&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
  <img src="https://img.shields.io/badge/-Lua-success?logo=lua&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
  <img src="https://img.shields.io/badge/-Linux-success?logo=linux&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
  <img src="https://img.shields.io/badge/-Neovim-success?logo=neovim&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
  <img src="https://img.shields.io/badge/-vim-success?logo=vim&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
 </p>

<h4 align="center">
<a href="#requirements">Requirements</a> •
<a href="#installation">Installation</a> •
<a href="#keymaps">Keymap</a> •
<a href="#plugins">Plugins</a> •
<a href="#captures">Captures</a> •
<a href="#q&a">Q&A</a> 
</h4>

<!-- ## 📍 Requirements  -->
<h2 id="requirements">📍 Requirements</h2>

- Python3
- pip
- Neovim 0.9+
- [nerdfonts](https://www.nerdfonts.com/)
- NodeJS

<!-- ##  ⚡ Installation -->

<h2 id="installation">⚡ Installation</h2>
Just run this in the terminal:

```bash
git clone https://github.com/RchrdAriza/NvimOnMy_Way ~/.config/nvim && nvim
```

<!-- ## ⌨️ Keymaps -->
<h2 id="keymaps">⌨️ Keymaps</h2>

To go to see the keymaps click [here](keymaps_readme.md)

<!-- ## 🔌 Plugins -->
<h2 id="plugins">🔌 Plugins</h2>
It has about 60 plugins and these are some of them

#### Package Manager

- [lazy.nvim](https://github.com/folke/lazy.nvim) - A modern plugin manager.

#### File Explorer

- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) - Manage and browse the file system.

#### LSP plugins

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Configurations for the LSP client.
- [mason](https://github.com/williamboman/mason.nvim) - Install and manage LSP servers.
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) - Bridge between mason and lsp-ocnfig.
- [trouble.nvim](https://github.com/folke/trouble.nvim) - A pretty diagnostics, references, telescope results, quickfix and location list.

#### Autocompletion

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion plugin.

#### Formatter

- [Formatter](https://github.com/mhartington/formatter.nvim)

#### Colorscheme

- [Tokyo-night](https://github.com/folke/tokyonight.nvim) - A clean, dark Neovim theme written in Lua
- [Material-nvim](https://github.com/marko-cerovac/material.nvim) - A clean, dark Neovim theme written in Lua

#### Snippet Engine

- [Luasnip](https://github.com/L3MON4D3/LuaSnip) - A snippet engine.
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Snippets collection for a set of different programming languages.

#### Tabline and Statusline

- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - A snazzy buffer line.
- [lualine](https://github.com/nvim-lualine/lualine.nvim) - A blazing fast and easy to configure neovim statusline plugin written in pure lua.

#### Git integration

- [advanced-git-search](https://github.com/aaronhallaert/advanced-git-search.nvim) - Search your git history by commit message, content and author with Telescope.
- [diffview.nvim](https://github.com/sindrets/diffview.nvim) - Interface for easily cycling through diffs.
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Git integration: signs, hunk actions, blame, etc.

#### Utils

- [cheatsheet.nvim](https://github.com/sudormrfbin/cheatsheet.nvim) - Searchable cheatsheet.
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - IndentLine replacement.
- [multicursors.nvim](https://github.com/smoka7/multicursors.nvim) - A multi cursor plugin.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - A minimalist autopairs.
- [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua) - A high-performance color highlighter.
- [nvim-notify](https://github.com/rcarriga/nvim-notify) - A fancy, configurable, notification manager.
- [nvim-surround](https://github.com/kylechui/nvim-surround) - A plugin for adding/changing/deleting surrounding delimiter pairs.
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Show dev icons.
- [rainbow-delimiters](https://github.com/HiPhish/rainbow-delimiters.nvim) - Rainbow delimiters for Neovim with Treesitter.
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Popup of keybindings.
- [yanky.nvim](https://github.com/gbprod/yanky.nvim) - Improved Yank and Put functionalities.

#### Treesitter

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Neovim Treesitter configurations and abstraction layer.
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) - Shows the context of the currently visible buffer contents.

#### Telescope

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - An extendable fuzzy finder. Find files, Filter, Preview, Pick. All in one!
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) - A file browser extension for telescope.nvim.
- [telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim) - Visualize your undo tree and fuzzy-search changes in it.
- [telescope-emoji.nvim](https://github.com/xiyaowong/telescope-emoji.nvim) - An extension for telescope.nvim that allows you to search emojis 😃.

#### Comments

- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Smart and powerful comment plugin.
- [comment-box.nvim](https://github.com/LudoPinelli/comment-box.nvim) - Clarify and beautify your comments using boxes and lines.

#### Degub Adapter Protocol

- [nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol client implementation for Neovim.

<!-- ## 📷 Captures -->
<h2 id="captures">📷 Captures</h2>

<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1693761097/Nvim/Main_menu.jpg' alt="inicio" width=320  >
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1683990002/NvimOnMy_Way/Python.jpg.jpg' alt="python" width=320>
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1683990014/NvimOnMy_Way/FileExplorer.jpg.jpg' alt="FileExplorer" width=320>
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1693761506/Nvim/Oldfiles.jpg' alt="OldFiles" width=320>
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1693762056/Nvim/Whickey.jpg' alt="Whichkey" width=320>
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1693762538/Nvim/Python.jpg' alt="python_lsp" width=320>

## Q&A

Why do some strange characters appear instead of the icons?

<p>

To avoid this error is necessary to use [nerdfonts](https://www.nerdfonts.com).
_In case of using termux install [termux-style](https://f-droid.org/es/packages/com.termux.styling) and change the font_

</p>
