return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		keymap = { preset = "super-tab" },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
			ghost_text = { enabled = true },
		},
		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},
		fuzzy = {
			sorts = {
				function(a, b)
					local client_a = vim.lsp.get_client_by_id(a.client_id)
					local client_b = vim.lsp.get_client_by_id(b.client_id)

					-- If one is emmet and the other isn't, prioritize the non-emmet one
					if client_a and client_b then
						local name_a = client_a.name
						local name_b = client_b.name

						-- Adjust these names if you use 'emmet_ls' instead of 'emmet_language_server'
						local is_emmet_a = name_a == "emmet_language_server" or name_a == "emmet_ls"
						local is_emmet_b = name_b == "emmet_language_server" or name_b == "emmet_ls"

						if is_emmet_a and not is_emmet_b then
							return false -- a (emmet) should be sorted *after* b
						elseif not is_emmet_a and is_emmet_b then
							return true -- a (non-emmet) should be sorted *before* b
						end
					end
					-- If neither or both are emmet, return nil to fallback to the next sort method
					return nil
				end,

				-- Fallback to standard sorting (score, recently used, etc.)
				"score",
				"sort_text",
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
}
