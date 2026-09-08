return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",

  dependencies = {
    "mason-org/mason.nvim",
  },

  opts = {
    ensure_installed = {
      "prettier",
      "stylua",
      "eslint_d",
    },

    auto_update = false,
    run_on_start = true,
  },
}
