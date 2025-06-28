-- File: lua/plugins/lsp/cmp.lua
-- Konfigurasi Autocompletion Engine (nvim-cmp)

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Sumber untuk LSP
    "hrsh7th/cmp-buffer",   -- Sumber untuk buffer
    "hrsh7th/cmp-path",     -- Sumber untuk path file
    "L3MON4D3/LuaSnip",     -- Engine snippet
    "saadparwaiz1/cmp_luasnip", -- Integrasi snippet dengan cmp
    "rafamadriz/friendly-snippets"
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Terima saran dengan Enter
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
