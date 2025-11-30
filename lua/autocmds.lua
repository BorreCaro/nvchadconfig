require "nvchad.autocmds"
-- Indent changer
local indent_config = require "configs.indent_settings"
for filetype, settings in pairs(indent_config.settings) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = function()
      for option, value in pairs(settings) do
        vim.opt_local[option] = value
      end
    end,
  })
end
-- Cerrar terminal con Esc
_G.terminal_close_key = "<Esc>"
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.keymap.set("t", _G.terminal_close_key, "<C-\\><C-n>:bd!<CR>", { buffer = bufnr, silent = true })
  end,
})
-- Yank Highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
