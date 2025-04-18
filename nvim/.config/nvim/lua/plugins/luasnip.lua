return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets/json" })
      require("luasnip.loaders.from_lua").load({ paths = "./snippets/lua" })
    end,
  },
}
