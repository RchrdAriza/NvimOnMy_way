return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_no_tab_map = true

		vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })
	end,
}
