return {
	"kristijanhusak/vim-dadbod-ui",

	dependencies = {
		{
			"tpope/vim-dadbod",
			lazy = true,
		},
		{
			"kristijanhusak/vim-dadbod-completion",
			ft = { "sql", "mysql", "plsql" },
			lazy = true,
		},
	},

	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 0

		vim.g.dbs = {
			{
				name = "learnfastify",
				url = "postgres://trantinh:123456@localhost:5432/learnfastify",
			},
			{
				name = "tiembanhnhatun",
				url = "postgres://tiembanhnhatun:123456@localhost:5432/tiembanhnhatun",
			},
		}
	end,
}
