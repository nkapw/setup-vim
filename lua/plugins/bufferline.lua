return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					indicator = {
						-- style = "underline",
					},
					separator_style = "slant",
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local icon = level:match("error") and " " or " "
						if context.buffer:current() then
							return "" .. icon .. count
						end

						return "" .. icon .. count
					end,
				},
			})
            vim.keymap.set("n", "gb", "<CMD>BufferLinePick<CR>")
            vim.keymap.set("n", "gD", "<CMD>BufferLinePickClose<CR>")
            vim.keymap.set("n", "[b", "<CMD>BufferLineCycleNext<CR>")
            vim.keymap.set("n", "b]", "<CMD>BufferLineCyclePrev<CR>")
		end,
	},
}
