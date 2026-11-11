return {
	"mfussenegger/nvim-lint",

	event = {
		"BufReadPre",
		"BufNewFile",
	},

	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}

		local function get_project_root()
			local file = vim.api.nvim_buf_get_name(0)
			local markers = {
				"eslint.config.mjs",
				"eslint.config.js",
				"eslint.config.cjs",
				"package.json",
				".git",
			}

			local root = vim.fs.root(file, markers)
			return root or vim.fn.getcwd()
		end

		vim.api.nvim_create_autocmd({
			"BufWritePost",
			"BufReadPost",
			"InsertLeave",
		}, {
			callback = function()
				lint.try_lint(nil, {
					cwd = get_project_root(),
				})
			end,
		})
	end,
}
