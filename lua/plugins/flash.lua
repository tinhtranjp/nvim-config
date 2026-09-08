return {
	"folke/flash.nvim",
	event = "VeryLazy",

	opts = {},

	config = function(_, opts)
		require("flash").setup(opts)

		vim.api.nvim_set_hl(0, "FlashLabel", {
			fg = "#ffffff",
			bg = "#ff0000",
			bold = true,
		})
	end,
}
