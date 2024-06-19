-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("n", "<M-Left>", "<cmd>vertical resize -2<cr>")
keymap.set("n", "<M-Right>", "<cmd>vertical resize +2<cr>")
keymap.set("n", "<M-Up>", "<cmd>horizontal resize +2<cr>")
keymap.set("n", "<M-Down>", "<cmd>horizontal resize -2<cr>")

keymap.set("n", "<leader>gV", "<cmd>!gh pr view --web<cr>", { noremap = true, silent = true, desc = "View PR" })
keymap.set("n", "<leader>gP", "<cmd>!gh pr create --web<cr>", { noremap = true, silent = true, desc = "Create PR" })
keymap.set("n", "<leader>gR", "<cmd>!gh repo view --web<cr>", { noremap = true, silent = true, desc = "View Repo" })
keymap.set(
  "n",
  "<leader>gT",
  "<cmd>!git commit -am 'try this' && git push<cr>",
  { noremap = true, silent = true, desc = "Try This..." }
)
keymap.set(
  "n",
  "<leader>gM",
  "<cmd>!git commit --allow-empty -m 'empty commit' && git push<cr>",
  { noremap = true, silent = true, desc = "Push Empty Commit" }
)
keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>")
