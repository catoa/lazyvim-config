# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Overview

System dependencies:

- fzf (optional)
- ripgrep (optional)
- cargo (optional)
- NerdFonts

Installing LazyVim

- Link: <https://www.lazyvim.org/installation>
- Created by <https://github.com/folke>

Vim Navigation

- Basics: hjkl
- Jump to beginning/end of line: 0, $
- Jump to beginning/end of file: gg, G
- Jump to line: :`<line number>`
- Jump to word: w, b, e
- Jump to next/previous word: f, F, t, T
- Jump to next/previous character: ;, ,
- Search: /, n, N
- Next/previous jump locations: Ctrl-O, Ctrl-I

LazyVim Config

- keymaps.lua - define custom commands
- autocmds.lua - define commands that are executed automatically
  based on events (e.g. BufEnter, BufLeave)
- options.lua - define global options

My Favorite/Recommended Plugins

- hop.nvim
- mason
- vim-fugitive
- lazygit (not a vim plugin, but well-supported by LazyVim)
- markdown-preview.nvim
- nvim-treesitter/nvim-treesitter-context

LazyExtras => run `:LazyExtras` to get a list of plugin collections
