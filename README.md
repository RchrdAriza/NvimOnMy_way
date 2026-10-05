 <p align="Center">
  <img src="https://res.cloudinary.com/dhqo7n9gd/image/upload/v1693760235/Nvim/Head.jpg" >
 </p>

  <p align="Center">
  <img src="https://img.shields.io/badge/-%3E=0.12.0-success?logo=neovim&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
  <img src="https://img.shields.io/badge/-Lua-success?logo=lua&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
  <img src="https://img.shields.io/badge/-Linux-success?logo=linux&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
  <img src="https://img.shields.io/badge/-Neovim-success?logo=neovim&logoColor=ffffff&labelColor=246FFF&color=7A7A7A" >
 </p>

<h4 align="center">
<a href="#requirements">Requirements</a> •
<a href="#installation">Installation</a> •
<a href="#keymaps">Keymaps</a> •
<a href="#plugins">Plugins</a> •
<a href="#captures">Captures</a> •
</h4>

<h2 id="requirements">Requirements</h2>

- Python
- pip
- Neovim 0.12+
- [nerdfonts](https://www.nerdfonts.com/)
- NodeJS
- [lazygit](https://github.com/jesseduffield/lazygit) (optional)
- Go (optional, only needed for gopls and golangci-lint)

>[!IMPORTANT]
> [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md)


<h2 id="installation">Installation</h2>
Just run this in the terminal:

```bash
git clone https://github.com/RchrdAriza/NvimOnMy_Way ~/.config/nvim && nvim
```

<h2 id="keymaps">Keymaps</h2>

>[!NOTE]
> Just press the leader key (space) to see them

<h2 id="plugins">Plugins</h2>
These are the main ones:

#### Package Manager

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager.

#### Core

- [snacks.nvim](https://github.com/folke/snacks.nvim) - Picker, file explorer, lazygit, images and more.
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Popup of keybindings.
- [noice.nvim](https://github.com/folke/noice.nvim) - UI for messages, cmdline and popupmenu.
- [nvim-notify](https://github.com/rcarriga/nvim-notify) - Notification manager.

#### LSP

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Configurations for the LSP client.
- [mason.nvim](https://github.com/williamboman/mason.nvim) - Install LSP servers, linters and formatters.
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) - Bridge between mason and lspconfig.
- [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) - Auto install tools with mason.
- [trouble.nvim](https://github.com/folke/trouble.nvim) - Diagnostics list.
- [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) - Signature help while typing.
- [fidget.nvim](https://github.com/j-hui/fidget.nvim) - LSP progress.
- [outline.nvim](https://github.com/hedyhli/outline.nvim) - Symbols outline.
- [venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim) - Python virtualenv selector.

#### Completion and Snippets

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine.
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine.
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Snippets collection.

#### Formatting

- [conform.nvim](https://github.com/stevearc/conform.nvim) - Formatter.

#### AI

- [claudecode.nvim](https://github.com/coder/claudecode.nvim) - Claude Code integration.

#### UI

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - Colorscheme.
- [alpha-nvim](https://github.com/goolord/alpha-nvim) - Dashboard.
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - Tabline.
- [heirline.nvim](https://github.com/rebelot/heirline.nvim) - Statusline.
- [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim) - Winbar with breadcrumbs.
- [statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim) - Status column.
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - Indent guides.
- [rainbow-delimiters](https://github.com/HiPhish/rainbow-delimiters.nvim) - Rainbow delimiters.
- [nvim-colorizer](https://github.com/catgoose/nvim-colorizer.lua) - Color highlighter.

#### Git

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Signs, hunk actions and blame.
- [git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim) - Resolve merge conflicts.
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) - Lazygit inside Neovim.

#### Editing

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter configurations.
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) - Folding.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autopairs.
- [nvim-surround](https://github.com/kylechui/nvim-surround) - Surround delimiters.
- [ts-comments.nvim](https://github.com/folke/ts-comments.nvim) - Better native comments.
- [yanky.nvim](https://github.com/gbprod/yanky.nvim) - Improved yank and put.
- [auto-save.nvim](https://github.com/Pocco81/auto-save.nvim) - Auto save.
- [guess-indent.nvim](https://github.com/nmac427/guess-indent.nvim) - Indent detection.

#### Tools

- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - Terminal.
- [code_runner.nvim](https://github.com/CRAG666/code_runner.nvim) - Run code.
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - Move between Neovim and tmux splits.

<h2 id="captures">Captures</h2>

<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1781233043/NOMW_owhc6y.png' alt="home" >
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1713064220/Screenshot_2024-04-13_21-56-55_s3i5rg.png' alt="inicio" >
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1713064220/Screenshot_2024-04-13_21-39-50_tj2qqd.png' alt="Transparent" >
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1713064220/Screenshot_2024-04-13_21-55-37_woaf8n.png' alt="CMP">
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1713064208/Screenshot_2024-04-13_21-34-30_kiwvcu.png' alt="Terminal">
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1713064206/Screenshot_2024-04-13_21-32-40_oasrbf.png' alt="Error">
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1713064168/Screenshot_2024-04-13_21-59-49_zvfwmq.png' alt="lsp-action">
<img src='https://res.cloudinary.com/dhqo7n9gd/image/upload/v1713064202/Screenshot_2024-04-13_21-31-04_ww7v6z.png' alt="oldfiles">
