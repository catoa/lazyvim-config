return {
  { "MunifTanjim/prettier.nvim" },
  { "MunifTanjim/eslint.nvim" },
  { "rust-lang/rust.vim" },
  { "cappyzawa/starlark.vim" },
  {
    "topaxi/gh-actions.nvim",
    cmd = "GhActions",
    keys = {
      { "<leader>ga", "<cmd>GhActions<cr>", desc = "Open Github Actions" },
    },
    -- optional, you can also install and use `yq` instead.
    build = "make",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    opts = {},
    config = function(_, opts)
      require("gh-actions").setup(opts)
    end,
  },
  { "gleam-lang/gleam.vim", ft = "gleam" },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      "b0o/SchemaStore.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
        require("lspconfig").tilt_ls.setup({})
      end,
    },
    ---@class PluginLspOpts
    opts = {
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
      inlay_hints = { enabled = true },
    },
  },
}
