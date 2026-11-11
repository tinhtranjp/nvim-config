local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.mouse = "a"

opt.termguicolors = true

opt.signcolumn = "yes"

opt.cursorline = true

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2

opt.completeopt = {
	"menuone",
	"noselect",
	"popup",
}

opt.autocomplete = false
opt.complete = ".,o"

opt.clipboard = "unnamedplus"

vim.g.clipboard = {
	name = "win32yank",

	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},

	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},

	cache_enabled = 0,
}

vim.opt.foldenable = false
vim.opt.foldlevel = 99

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
