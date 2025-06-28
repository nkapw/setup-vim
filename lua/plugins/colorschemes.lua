return {
	"Mofiqul/vscode.nvim",
	lazy = false, -- Muat tema warna saat startup
	priority = 1000, -- Pastikan tema dimuat sebelum plugin lain
	config = function()
		local c = require("vscode.colors").get_colors()
		require("vscode").setup({
			style = "dark",
			transparent = true,
			italic_comments = true,
			disable_nvimtree_bg = true,
			terminal_colors = true,
			color_overrides = {
				vscLineNumber = "#FFFFFF",
			},
			group_overrides = {
				Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
			},
		})
		-- Terapkan colorscheme
		vim.cmd.colorscheme("vscode")
		vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#808080", bg = "NONE", italic = true })
	end,
}
