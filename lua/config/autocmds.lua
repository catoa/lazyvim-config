-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*.zsh", "*.zshrc" },
  callback = function()
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*.zsh", "*.zshrc" },
  callback = function()
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "yml", "yaml" },
  command = "set foldmethod=indent",
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "json", "jsonc" },
  command = "setlocal wrap",
})
