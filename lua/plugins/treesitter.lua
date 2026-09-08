return {
  "nvim-treesitter/nvim-treesitter",

  lazy = false,

  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").install({
      "javascript",
      "tsx",
      "html",
      "css",
      "json",
      "lua",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
        "css",
        "json",
        "lua",
      },

      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
