return {
	"nvim-tree/nvim-tree.lua",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	cmd = {
		"NvimTreeToggle",
		"NvimTreeFocus",
		"NvimTreeFindFile",
	},

	keys = {
		{
			"<leader>e",
			"<cmd>NvimTreeToggle<cr>",
			desc = "Toggle file tree",
		},
		{
			"<leader>f",
			"<cmd>NvimTreeFindFile<cr>",
			desc = "Find current file",
		},
	},

	config = function()
		require("nvim-tree").setup({
			view = {
				width = 35,
				side = "left",
			},

			renderer = {
				group_empty = true,
			},

			filters = {
				dotfiles = false,
			},

			git = {
				enable = true,
			},

			diagnostics = {
				enable = true,
			},

			update_focused_file = {
				enable = true,
				update_root = true,
			},

			actions = {
				open_file = {
					quit_on_open = false,
				},
			},
		})
	end,
}
