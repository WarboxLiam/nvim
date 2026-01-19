return {
	"catppuccin/nvim", -- Cuuuute
	lazy = false, -- Don't lazyload main colorscheme
	name = "Catppuccin",
	priority = 1000, -- Load before everything else
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			auto_integrations = true,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
