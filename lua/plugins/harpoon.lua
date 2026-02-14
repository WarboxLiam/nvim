return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"<C-e>",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			{ desc = "Harpoon - Toggle quick menu" },
		},
		{
			"<leader>a",
			function()
				require("harpoon.mark").add_file()
			end,
			{ desc = "Harpoon - Mark file" },
		},
		{
			"<C-H>",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			{ desc = "Harpoon - Nav file 1" },
		},
		{
			"<C-J>",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			{ desc = "Harpoon - Nav file 2" },
		},
		{
			"<C-K>",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			{ desc = "Harpoon - Nav file 3" },
		},
		{
			"<C-L>",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			{ desc = "Harpoon - Nav file 4" },
		},
	},
}
