return {
	"stevearc/conform.nvim",
	config = function()
		vim.env.XDG_RUNTIME_DIR = vim.fn.expand("~/.cache/prettierd")

		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 3000,
				lsp_fallback = true,
			},
		})
	end,
}
