return {
  "mason-org/mason-lspconfig.nvim",

  opts = {
    ensure_installed = {
      "lua_ls",
    },

    automatic_enable = true,
  },

  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
}
