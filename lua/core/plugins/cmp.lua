local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-calc",
    "lukas-reineke/cmp-rg",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")

    local sources = {
      { name = "nvim_lsp" },
      { name = "buffer",  keyword_length = 5 },
      { name = "luasnip" },
      { name = "calc" },
      { name = "path" },
      { name = "rg",      keyword_length = 5 },
    }

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
      },
      sources = sources,
    })
  end,
}

return M
