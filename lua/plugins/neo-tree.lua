return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			--  vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>", {})
			vim.keymap.set("n", "<leader>e", ":Neotree toggle reveal right<CR>", {})
			vim.keymap.set("n", "<leader>r", ":Neotree focus<CR>", {})
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						visible = true, -- Show hidden files
						hide_dotfiles = false, -- Optionally, set this to false to always show dotfiles
					},
				},
			})
		end,
	},
}
