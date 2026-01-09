return {
	"catppuccin/nvim",
	name = "Catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			auto_integrations = true,
		})

		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
