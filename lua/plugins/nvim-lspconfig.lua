return {
	{
		"williamboman/mason.nvim",
		opts = {},
		priority = 1000, -- Ensures it loads first
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"bashls",
				"cssls",
				"emmet_ls",
				"graphql",
				"html",
				"eslint",
				"jsonls",
				"lua_ls",
				"marksman",
				"mdx_analyzer",
				"rust_analyzer",
				"ts_ls",
				"tailwindcss",
				"vimls",
				"lemminx",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		version = "*",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- Enable servers
			vim.lsp.enable({
				"bashls",
				"cssls",
				"emmet_ls",
				"graphql",
				"html",
				"eslint",
				"jsonls",
				"lua_ls",
				"marksman",
				"mdx_analyzer",
				"rust_analyzer",
				"ts_ls",
				"tailwindcss",
				"vimls",
				"lemminx",
			})

			-- Adjust settings accordingly
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

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP Actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

					-- Custom keymaps
					vim.keymap.set("n", "<leader>vd", function()
						vim.diagnostic.open_float()
					end, opts)
					vim.keymap.set("n", "<leader>[d", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, opts)
					vim.keymap.set("n", "<leader>]d", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, opts)
				end,
			})
		end,
	},
}
