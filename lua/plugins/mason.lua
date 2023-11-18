return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "ruff",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}
