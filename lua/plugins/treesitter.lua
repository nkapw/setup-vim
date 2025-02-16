return {
	{
		"nvim-treesitter/nvim-treesitter",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({

				autotag = {
					enable = true,
				},
				ensure_installed = { "lua", "javascript", "go" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
