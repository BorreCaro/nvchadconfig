require("nvchad.configs.lspconfig").defaults()
local lsp = vim.lsp
local servers = { "html", "cssls", "pyright", "clangd" }
lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
