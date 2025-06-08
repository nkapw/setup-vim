return {
	{
		--        "catppuccin/nvim",

		-- "sainnhe/gruvbox-material",
		-- lazy = false,
		-- name = "gruvbox",
		-- priority = 1000,
		-- config = function()
		-- 	vim.g.gruvbox_material_background = "hard"
		-- 	vim.g.gruvbox_material_transparent_background = 1
		-- 	vim.cmd.colorscheme("gruvbox-material")
		-- end,

		-- "nyoom-engineering/oxocarbon.nvim",
		-- config = function()
		-- 	vim.cmd("colorscheme oxocarbon")
		-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- 	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		-- end,
		--

		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				transparent = {
					-- Enable transparent background.
					bg = true,
					-- Enable transparent background for floating windows.
					float = true,
				},
			})
			vim.cmd.colorscheme("nordic")
		end,
	},
}
