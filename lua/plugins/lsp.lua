return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"bashls",
				"cssls",
				"emmet_ls",
				"graphql",
				"html",
				"eslint",
				"jsonls",
				"stylua",
				"marksman",
				"mdx_analyzer",
				"rust_analyzer",
				"ts_ls",
				"tailwindcss",
				"vimls",
				"lemminx", -- XML
				-- Formatters
				"biome",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
