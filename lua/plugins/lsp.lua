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
			{
				"neovim/nvim-lspconfig",
				config = function()
					-- Enable vim globals in lua
					vim.lsp.config("lua_ls", {
						settings = {
							-- Enable vim global for vim config directories
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
							},
						},
					})

					vim.api.nvim_create_autocmd("LspAttach", {
						desc = "LSP Actions",
						callback = function(event)
							local opts = { buffer = event.buf }

							vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
							vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
							vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
							vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
							vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
							vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
							vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
							vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
							vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

							-- Custom keymaps
							vim.keymap.set("n", "<leader>vd", function()
								vim.diagnostic.open_float()
							end, { buffer = event.buf, desc = "Diagnostic - Open float" })
							vim.keymap.set("n", "<leader>[d", function()
								vim.diagnostic.jump({ count = 1, float = true })
							end, { buffer = event.buf, desc = "Diagnostic - Next" })
							vim.keymap.set("n", "<leader>]d", function()
								vim.diagnostic.jump({ count = -1, float = true })
							end, { buffer = event.buf, desc = "Diagnostic - Prev" })
						end,
					})
				end,
			},
		},
	},
}
