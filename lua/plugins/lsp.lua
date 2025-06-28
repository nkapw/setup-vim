-- File: lua/plugins/lsp.lua (TANPA neovim/nvim-lspconfig DAN TANPA cmp-nvim-lsp)

return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"gopls",
					"pyright",
					"rust_analyzer",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		-- hrsh7th/cmp-nvim-lsp tidak lagi diperlukan.
		-- Jika plugin ini hanya ada di sini untuk default_capabilities, itu tidak lagi dibutuhkan.
		-- Jika ada alasan lain Anda menggunakannya (misalnya, integrasi kustom), Anda bisa mengembalikannya,
		-- tetapi untuk tujuan capabilities, blink.cmp sudah menanganinya.
		"nvim-lua/plenary.nvim", -- Plenary tetap sebagai dependency umum
		lazy = false,
		config = function()
			-- **PERBAIKAN:** Menggunakan blink.cmp.get_lsp_capabilities() untuk capabilities
			-- Ini akan mencakup kemampuan LSP bawaan dan yang disediakan oleh blink.cmp
			local capabilities = require("blink.cmp").get_lsp_capabilities({})

			local on_attach = require("core.autocmds").on_attach

			local setup_server = function(server_name)
				local server_config = {}
				local status_ok, loaded_config = pcall(require, "lsp." .. server_name)
				if status_ok and type(loaded_config) == "table" then
					server_config = loaded_config
				end

				local merged_config = vim.tbl_deep_extend("force", server_config, {
					capabilities = capabilities,
					on_attach = on_attach,
				})

				vim.lsp.config[server_name] = merged_config
			end

			setup_server("lua_ls")
			setup_server("tsserver")
			setup_server("gopls")
			setup_server("pyright")
			setup_server("rust_analyzer")

			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
			})
			vim.lsp.enable({
				"lua_ls",
				"tsserver",
				"gopls",
				"pyright",
				"rust_analyzer",
			})
		end,
	},
}
