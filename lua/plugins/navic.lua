return {
  "SmiteshP/nvim-navic",
  dependencies = { "neovim/nvim-lspconfig" },
  opts = {
    lsp = {
      auto_attach = true, -- Intenta adjuntarse automáticamente (funciona en setups simples)
    },
    highlight = true,
    separator = "  ",
    depth_limit = 0,
    depth_limit_indicator = "..",
  },
}
