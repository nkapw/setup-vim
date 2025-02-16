return {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})

        require("go").setup({
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
                callback = function()
                    require("go.format").goimports()
                end,
                group = format_sync_grp,
            }),
        })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod", "gowork", "gosum" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
