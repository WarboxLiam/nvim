return {
	"saghen/blink.cmp",
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	dependencies = { "rafamadriz/friendly-snippets" },
	opts = {
		keymap = { preset = "super-tab" },
		completion = {
			documentation = {
				auto_show = true,
			},
			ghost_text = {
				enabled = true,
			},
		},
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},
	},
}
