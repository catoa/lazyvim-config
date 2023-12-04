-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

local opts = { noremap = true, silent = true }
keymap.set("n", "<M-Left>", "<cmd>vertical resize -2<cr>")
keymap.set("n", "<M-Right>", "<cmd>vertical resize +2<cr>")
keymap.set("n", "<M-Up>", "<cmd>horizontal resize +2<cr>")
keymap.set("n", "<M-Down>", "<cmd>horizontal resize -2<cr>")

keymap.set("n", "<leader>fP", "<cmd>Telescope projects<cr>")
keymap.set(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍 <CR>",
  opts
)
keymap.set("n", "<C-_>", "gcc", { remap = true, silent = true, desc = "Comment line" })
keymap.set("x", "<C-_>", "gc", { remap = true, silent = true, desc = "Comment selection" })
