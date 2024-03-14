vim.api.nvim_set_keymap("n", "gt", ":bnext<CR>", { noremap = true })
--vim.api.nvim_set_keymap('n', "<C-x", '')
vim.api.nvim_set_keymap("n", "gT", ":bprevious<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<bs>", ":bprevious<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<C-s>", ":lua Save()<cr>", { noremap = true })
-- Telescope buffers
vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>:JABSOpen<cr>", { noremap = true })
--
vim.cmd([[
" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
]])

-- local opts = { buffer = ev.buf }

vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { noremap = true }, { desc = "vim.lsp.buf.signature_help" })
-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true }, { desc = "vim.lsp.buf.definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.definition, { noremap = true }, { desc = "vim.lsp.buf.definition" })
-- vim.keymap.set("n", "<space>wl", function()
-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, opts)
-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true }, { desc = "vim.lsp.buf.references" })
