return {
	'hrsh7th/nvim-cmp',
	event = "InsertEnter",
	dependencies = {
	  'hrsh7th/cmp-nvim-lsp',
	  'hrsh7th/cmp-buffer',
	  'hrsh7th/cmp-path',
	  'hrsh7th/cmp-cmdline',
	  'saadparwaiz1/cmp_luasnip',
	  {
		'L3MON4D3/LuaSnip',
		dependencies = {
		  'rafamadriz/friendly-snippets',
		},
		config = function()
		  require('luasnip.loaders.from_vscode').lazy_load()
		end,
	  },
	  'onsails/lspkind.nvim',
	}
}
