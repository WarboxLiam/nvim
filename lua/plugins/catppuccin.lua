return {
	"catppuccin/nvim",
	name = "Catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
