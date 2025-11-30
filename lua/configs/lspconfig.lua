-- Cargamos los defaults de NvChad (on_attach y capabilities base)
local config = require "nvchad.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"
local navic = require "nvim-navic"

local servers = { "html", "cssls", "pyright", "clangd" }

-- Función para conectar Navic + Defaults de NvChad
local function custom_on_attach(client, bufnr)
  -- 1. Cargar mapeos y settings de NvChad
  on_attach(client, bufnr)

  -- 2. Conectar Navic si el servidor soporta símbolos
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

-- Inicializar servidores
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
  }
end -- read :h vim.lsp.config for changing options of lsp servers
