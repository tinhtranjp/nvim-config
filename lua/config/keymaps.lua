vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<C-Left>", "5<C-w><", { desc = "Resize left" })
vim.keymap.set("n", "<C-Right>", "5<C-w>>", { desc = "Resize right" })
vim.keymap.set("n", "<C-Up>", "5<C-w>+", { desc = "Resize up" })
vim.keymap.set("n", "<C-Down>", "5<C-w>-", { desc = "Resize down" })
vim.opt.timeoutlen = 300
local map = vim.keymap.set

vim.keymap.set("n", "<leader>dy", function()
	local diagnostics = vim.diagnostic.get(0, {
		lnum = vim.api.nvim_win_get_cursor(0)[1] - 1,
	})

	if #diagnostics == 0 then
		vim.notify("Không có diagnostic ở dòng này")
		return
	end

	local message = table.concat(
		vim.tbl_map(function(d)
			return d.message
		end, diagnostics),
		"\n"
	)

	vim.fn.setreg("+", message)
	vim.notify("Đã copy lỗi")
end, { desc = "Copy diagnostic" })
-- =========================================================
-- General
-- =========================================================

map("n", "<leader>w", "<cmd>w<cr>", {
	desc = "Save",
})

map("n", "<leader>q", "<cmd>q<cr>", {
	desc = "Quit",
})

map("n", "<Esc>", "<cmd>nohlsearch<cr>", {
	desc = "Clear search highlight",
})

-- Window navigation

map("n", "<C-h>", "<C-w>h", {
	desc = "Go to left window",
})

map("n", "<C-j>", "<C-w>j", {
	desc = "Go to lower window",
})

map("n", "<C-k>", "<C-w>k", {
	desc = "Go to upper window",
})

map("n", "<C-l>", "<C-w>l", {
	desc = "Go to right window",
})

-- =========================================================
-- Lazy / Mason
-- =========================================================

map("n", "<leader>l", "<cmd>Lazy<cr>", {
	desc = "Lazy",
})

map("n", "<leader>m", "<cmd>Mason<cr>", {
	desc = "Mason",
})

-- =========================================================
-- File Explorer
-- =========================================================

map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", {
	desc = "Explorer",
})

map("n", "<leader>o", "<cmd>NvimTreeFocus<cr>", {
	desc = "Focus explorer",
})

-- =========================================================
-- Telescope
-- =========================================================
vim.keymap.set("n", "<leader>fa", function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.expand("~"),
		hidden = true,
	})
end, { desc = "Find files (home)" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {
	desc = "Find files",
})

map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {
	desc = "Live grep",
})

map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {
	desc = "Buffers",
})

map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {
	desc = "Recent files",
})

map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {
	desc = "Help",
})

map("n", "<leader>fc", "<cmd>Telescope commands<cr>", {
	desc = "Commands",
})

map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", {
	desc = "Keymaps",
})

-- =========================================================
-- Buffers
-- =========================================================

map("n", "<S-h>", "<cmd>bprevious<cr>", {
	desc = "Previous buffer",
})

map("n", "<S-l>", "<cmd>bnext<cr>", {
	desc = "Next buffer",
})

map("n", "<leader>bd", "<cmd>bdelete<cr>", {
	desc = "Delete buffer",
})

map("n", "<leader>bo", function()
	local current = vim.api.nvim_get_current_buf()

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if
			buf ~= current
			and vim.api.nvim_buf_is_valid(buf)
			and vim.bo[buf].buflisted
			and vim.bo[buf].filetype ~= "NvimTree"
		then
			vim.api.nvim_buf_delete(buf, {})
		end
	end
end, {
	desc = "Delete other buffers",
})

-- =========================================================
-- LSP
-- =========================================================

map("n", "gd", vim.lsp.buf.definition, {
	desc = "Go to definition",
})

map("n", "gD", vim.lsp.buf.declaration, {
	desc = "Go to declaration",
})

map("n", "gi", vim.lsp.buf.implementation, {
	desc = "Go to implementation",
})

map("n", "gr", vim.lsp.buf.references, {
	desc = "References",
})

map("n", "K", vim.lsp.buf.hover, {
	desc = "Hover documentation",
})

map("n", "<leader>ls", vim.lsp.buf.signature_help, {
	desc = "Signature help",
})

map("n", "<leader>ca", vim.lsp.buf.code_action, {
	desc = "Code action",
})

map("n", "<leader>rn", vim.lsp.buf.rename, {
	desc = "Rename",
})
-- Diagnostics

map("n", "[d", vim.diagnostic.goto_prev, {
	desc = "Previous diagnostic",
})

map("n", "]d", vim.diagnostic.goto_next, {
	desc = "Next diagnostic",
})

map("n", "<leader>ld", vim.diagnostic.open_float, {
	desc = "Line diagnostics",
})

-- =========================================================
-- Completion
-- =========================================================

map("i", "<C-Space>", function()
	vim.lsp.completion.get()
end, {
	desc = "Trigger completion",
})

-- =========================================================
-- Formatting
-- =========================================================

map("n", "<leader>lf", function()
	require("conform").format({
		lsp_fallback = true,
	})
end, {
	desc = "Format",
})

-- =========================================================
-- Git - Gitsigns
-- =========================================================

map("n", "]c", function()
	require("gitsigns").next_hunk()
end, {
	desc = "Next git hunk",
})

map("n", "[c", function()
	require("gitsigns").prev_hunk()
end, {
	desc = "Previous git hunk",
})

map("n", "<leader>gp", function()
	require("gitsigns").preview_hunk()
end, {
	desc = "Preview hunk",
})

map("n", "<leader>gs", function()
	require("gitsigns").stage_hunk()
end, {
	desc = "Stage hunk",
})

map("n", "<leader>gr", function()
	require("gitsigns").reset_hunk()
end, {
	desc = "Reset hunk",
})

map("n", "<leader>gb", function()
	require("gitsigns").blame_line({
		full = true,
	})
end, {
	desc = "Blame line",
})

-- =========================================================
-- Git - Diffview
-- =========================================================

map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", {
	desc = "Open diff",
})

map("n", "<leader>gq", "<cmd>DiffviewClose<cr>", {
	desc = "Close diff",
})

map("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", {
	desc = "File history",
})

-- =========================================================
-- Terminal
-- =========================================================

map("n", "<C-\\>", "<cmd>ToggleTerm<cr>", {
	desc = "Toggle terminal",
})

map("t", "<C-\\>", "<cmd>ToggleTerm<cr>", {
	desc = "Toggle terminal",
})

-- =========================================================
-- Trouble
-- =========================================================

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", {
	desc = "Diagnostics",
})

map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", {
	desc = "Quickfix",
})

map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", {
	desc = "Location list",
})

-- =========================================================
-- DAP
-- =========================================================

map("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, {
	desc = "Toggle breakpoint",
})

map("n", "<leader>dc", function()
	require("dap").continue()
end, {
	desc = "Continue",
})

map("n", "<leader>di", function()
	require("dap").step_into()
end, {
	desc = "Step into",
})

map("n", "<leader>do", function()
	require("dap").step_over()
end, {
	desc = "Step over",
})

map("n", "<leader>dO", function()
	require("dap").step_out()
end, {
	desc = "Step out",
})

map("n", "<leader>dr", function()
	require("dap").restart()
end, {
	desc = "Restart",
})

map("n", "<leader>dq", function()
	require("dap").terminate()
end, {
	desc = "Terminate",
})

-- =========================================================
-- DAP UI
-- =========================================================

map("n", "<leader>du", function()
	require("dapui").toggle()
end, {
	desc = "Toggle debug UI",
})

-- =========================================================
-- Aerial
-- =========================================================

map("n", "<leader>a", "<cmd>AerialToggle<cr>", {
	desc = "Symbols outline",
})

-- =========================================================
-- Flash
-- =========================================================

map({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, {
	desc = "Flash jump",
})

map({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, {
	desc = "Flash Treesitter",
})

-- =========================================================
-- Comment
-- =========================================================

map("n", "gcc", function()
	require("Comment.api").toggle.linewise.current()
end, {
	desc = "Toggle comment",
})

map("v", "gc", function()
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, {
	desc = "Toggle comment",
})

-- =========================================================
-- Todo Comments
-- =========================================================

map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", {
	desc = "Find TODOs",
})

-- =========================================================
-- Persistence
-- =========================================================

map("n", "<leader>qs", function()
	require("persistence").load()
end, {
	desc = "Restore session",
})

map("n", "<leader>ql", function()
	require("persistence").load({
		last = true,
	})
end, {
	desc = "Restore last session",
})

map("n", "<leader>qd", function()
	require("persistence").stop()
end, {
	desc = "Stop session",
})

-- =========================================================
-- Neotest
-- =========================================================

map("n", "<leader>tt", function()
	require("neotest").run.run()
end, {
	desc = "Run nearest test",
})

map("n", "<leader>tf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, {
	desc = "Run file tests",
})

map("n", "<leader>to", function()
	require("neotest").output.open()
end, {
	desc = "Test output",
})

map("n", "<leader>ts", function()
	require("neotest").summary.toggle()
end, {
	desc = "Test summary",
})

-- =========================================================
-- Kulala
-- =========================================================

map("n", "<leader>rr", function()
	require("kulala").run()
end, {
	desc = "Run request",
})

map("n", "<leader>ra", function()
	require("kulala").run_all()
end, {
	desc = "Run all requests",
})

map("n", "<leader>ri", function()
	require("kulala").inspect()
end, {
	desc = "Inspect request",
})

-- =========================================================
-- Dadbod
-- =========================================================
-- <leader>du is already used by DAP UI.
-- Use <leader>Du for Dadbod instead.

map("n", "<leader>Du", "<cmd>DBUI<cr>", {
	desc = "Database UI",
})

-- =========================================================
-- UFO - Folding
-- =========================================================

map("n", "zR", function()
	require("ufo").openAllFolds()
end, {
	desc = "Open all folds",
})

map("n", "zM", function()
	require("ufo").closeAllFolds()
end, {
	desc = "Close all folds",
})

-- Chuyển buffer bằng <Space> + số (giống VS Code)
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		local ok, bufferline = pcall(require, "bufferline")
		if ok then
			bufferline.go_to(i, true)
		else
			-- Fallback nếu không có bufferline
			local bufs = vim.t.bufs or vim.api.nvim_list_bufs()
			local valid = {}
			for _, b in ipairs(bufs) do
				if vim.api.nvim_buf_is_loaded(b) and vim.bo[b].buflisted then
					table.insert(valid, b)
				end
			end
			if i <= #valid then
				vim.api.nvim_set_current_buf(valid[i])
			else
				vim.notify("Buffer " .. i .. " không tồn tại!", vim.log.levels.WARN)
			end
		end
	end, { noremap = true, silent = true, desc = "Go to buffer " .. i })
end
-- =========================================================
-- Plugins with default mappings / no mapping needed
-- =========================================================
--
-- autopairs
-- bufferline
-- colorizer
-- devicons
-- indent-blankline
-- mini-ai
-- mini-move
-- notify
-- nvim-surround
-- treesitter
-- which-key
--
-- These are intentionally left alone.
