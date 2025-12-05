-- Cargamos los defaults de NvChad (on_attach y capabilities base)
local config = require "nvchad.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

local navic = require "nvim-navic"

local servers = { "html", "cssls", "pyright", "clangd", "ruff", "jdtls" }

-- Función para conectar Navic + Defaults de NvChad
local function custom_on_attach(client, bufnr)
  -- 1. Cargar mapeos y settings de NvChad
  on_attach(client, bufnr)

  -- 2. Conectar Navic si el servidor soporta símbolos
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

-- Inicializar servidores (Sintaxis Neovim 0.11+)
for _, lsp in ipairs(servers) do
  -- 1. Configurar el servidor (fusiona con los defaults de lspconfig)
  vim.lsp.config(lsp, {
    on_attach = custom_on_attach,
    capabilities = capabilities,
  })

  -- 2. Habilitar el servidor
  vim.lsp.enable(lsp)
end
