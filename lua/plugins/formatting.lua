return {
	"stevearc/conform.nvim",
	config = function()
		vim.env.XDG_RUNTIME_DIR = vim.fn.expand("~/.cache/prettierd")

		local conform = require("conform")

		local function js_formatter(bufnr)
			-- Check if prettier is available (respects the require_cwd/root_file logic below)
			if conform.get_formatter_info("prettier", bufnr).available then
				return { "prettier" }
			else
				-- If prettier config not found, run both Biome formatters
				return { "biome-organize-imports", "biome" }
			end
		end

		conform.setup({
			formatters_by_ft = {
				javascript = js_formatter,
				javascriptreact = js_formatter,
				typescript = js_formatter,
				typescriptreact = js_formatter,
				css = { "biome", "prettierd", "prettier", stop_after_first = true },
				html = { "biome", "prettierd", "prettier", stop_after_first = true },
				json = { "biome", "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd" },
				mdc = { "prettierd" },
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 3000,
				lsp_fallback = true,
			},
			formatters = {
				prettier = {
					require_cwd = true,
					cwd = require("conform.util").root_file({
						".prettierrc",
					}),
				},
			},
		})
	end,
}
