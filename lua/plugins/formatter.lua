-- File: lua/plugins/formatter.lua
-- Konfigurasi untuk pemformatan kode terpusat menggunakan conform.nvim

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Jalankan sebelum menyimpan buffer
	cmd = { "ConformInfo" },
	opts = {
		-- Tentukan formatters untuk setiap jenis file
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofumpt" },
			rust = { "rustfmt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
		},
		-- Atur format_on_save untuk berjalan secara otomatis
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true, -- Jika conform gagal, coba gunakan LSP
		},
	},
	init = function()
		-- Tambahkan keymap untuk memformat secara manual
		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count > 0 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, lsp_fallback = true, range = range })
		end, { range = true })

		vim.keymap.set({ "n", "v" }, "<leader>lf", "<cmd>Format<CR>", { desc = "Format file atau seleksi" })
	end,
}
