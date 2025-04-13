require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		'lua_ls',
		'jsonls',
		'cssls',
		'html',
		'tailwindcss',
		'ts_ls',
		'rust_analyzer',
		'vimls',
		'emmet_ls',
		'eslint',
	},
	automatic_installation = true,
})
