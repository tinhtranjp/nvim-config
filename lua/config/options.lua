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

opt.autocomplete = true
opt.complete = ".,o"

opt.clipboard = "unnamedplus"

vim.g.clipboard = {
	name = "WSL Clipboard",

	copy = {
		["+"] = "clip.exe",
		["*"] = "clip.exe",
	},

	paste = {
		["+"] = 'powershell.exe -NoProfile -Command "Get-Clipboard"',
		["*"] = 'powershell.exe -NoProfile -Command "Get-Clipboard"',
	},

	cache_enabled = 0,
}

vim.opt.foldenable = false
vim.opt.foldlevel = 99
