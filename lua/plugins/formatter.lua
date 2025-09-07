-- File: ~/.config/nvim/lua/plugins/formatter.lua
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			go = { "goimports", "gofumpt" },
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
	},
}
