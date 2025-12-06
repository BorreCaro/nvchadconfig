local config = require "nvchad.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

require("java").setup {}
require("lspconfig").jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "java" },
}
