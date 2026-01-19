return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				word_diff = true
			})
		end,
	},
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
			{ "<leader>gm", "<cmd>Git mergetool<cr>", desc = "Git mergetool" },
		},
	}
}
