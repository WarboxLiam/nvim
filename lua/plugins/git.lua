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
		config = function()
			-- Set some sensible commands for git, prefix with g for sensibility

			vim.keymap.set("n", "<leader>gs", vim.cmd.Git) -- Git status
		end,
	}
}
