local api = vim.api

-- -- C++ tab settings for Google Style
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "c", "cpp", "h", "hpp" },
-- 	callback = function()
-- 		vim.bo.shiftwidth = 2
-- 		vim.bo.tabstop = 2
-- 		vim.bo.expandtab = true
-- 	end,
-- })

-- Enable soft wrap and word-wise navigation in markdown
api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
		vim.opt_local.showbreak = "  ↳ " -- visually indicate wrapped lines
		vim.opt_local.textwidth = 80 -- softwrap max length
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"

		-- ✨ Auto-wrap new text at 80 cols
		-- vim.opt_local.formatoptions:append("t")

		-- Make j/k move by visual lines when wrap is on
		local map = vim.keymap.set
		local opts = { buffer = true, silent = true }
		map({ "n", "x" }, "j", "gj", opts)
		map({ "n", "x" }, "k", "gk", opts)

		-- don't really use this a lot, dont mind typing gqap
		-- map("n", "Q", "gqap", { buffer = true, desc = "Format paragraph" })
	end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Automatically save the buffer when:
-- TextChages in Normal mode
-- Leave out of the Insert Mode
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	callback = function()
		local ft_exclude = { "NvimTree", "alpha", "oil" }
		if
			vim.bo.modified
			and vim.bo.modifiable
			and vim.bo.buftype == ""
			and not vim.tbl_contains(ft_exclude, vim.bo.filetype)
		then
			vim.cmd("silent! write")
		end
	end,
})
