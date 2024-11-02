return {
    {
        --        "catppuccin/nvim",
        --    "EdenEast/nightfox.nvim",
        --		"aliqyan-21/darkvoid.nvim",
        --        "rebelot/kanagawa.nvim",
        "sainnhe/gruvbox-material",
        lazy = false,
        name = "gruvbox",
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_background = "hard"
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
}
