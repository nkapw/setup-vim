-- File: lua/core/autocmds/lsp.lua
-- Konfigurasi Autocmd khusus untuk LSP

-- Fungsi `on_attach` yang akan dipanggil setiap kali LSP terhubung ke buffer
local on_attach = function(client, bufnr)
	-- Catatan: Jika Anda menggunakan `nvim-cmp`, Anda mungkin ingin menonaktifkan autokomplet bawaan Neovim
	-- if client.server_capabilities.completionProvider then
	--     vim.lsp.completion.disable(bufnr)
	-- end

	local buf_set_keymap = vim.api.nvim_buf_set_keymap
	local opts = { noremap = true, silent = true }

	-- Peta kunci LSP yang umum untuk buffer ini
	-- Ini adalah keymap yang disarankan, dan tidak akan menimpa default Neovim 0.11 jika tidak didefinisikan secara eksplisit.
	-- Keymap ini akan dieksekusi setelah keymap bawaan Neovim dan keymap lspsaga.
	buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	-- Keymap diagnostik
	buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

	-- Contoh: Inlay Hints (jika didukung server)
	-- Dokumenasi menunjukkan vim.lsp.inlay_hint.enable(true, client.id, ev.buf) atau (bufnr, true)
	-- if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
	vim.lsp.inlay_hint.enable(true, {})
	-- end

	-- Format on save (jika belum ditangani conform.nvim)
	-- Jika conform.nvim sudah menangani format on save, ini mungkin duplikat.
	-- Jika Anda ingin LSP formatter yang menangani, pastikan conform.nvim tidak aktif.
	-- if not client.server_capabilities.documentFormattingProvider and not client.server_capabilities.documentRangeFormattingProvider then
	--     -- Server tidak mendukung format, tidak perlu autocmd format
	-- else
	--     vim.api.nvim_create_autocmd('BufWritePre', {
	--         group = vim.api.nvim_create_augroup('LspFormatting_' .. bufnr, { clear = true }),
	--         buffer = bufnr,
	--         callback = function()
	--             vim.lsp.buf.format({ bufnr = bufnr, async = false }) -- Format secara sinkron sebelum menyimpan
	--         end,
	--     })
	-- end
end

-- Membuat Autocmd Group untuk menghindari duplikasi autocmd
local lsp_group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

-- Mendaftarkan autocmd untuk event LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_group,
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			on_attach(client, bufnr)
		end
	end,
})

-- Kembalikan fungsi on_attach jika Anda ingin memanggilnya secara manual dari tempat lain
return {
	on_attach = on_attach,
	lsp_group = lsp_group,
}
