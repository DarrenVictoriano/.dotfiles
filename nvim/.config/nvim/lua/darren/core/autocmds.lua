local api = vim.api

-- Enable soft wrap and word-wise navigation in markdown
api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
		vim.opt_local.showbreak = "  ↳ " -- visually indicate wrapped lines
		-- Make j/k move by visual lines when wrap is on
		vim.keymap.set("n", "j", "gj", { buffer = true, silent = true })
		vim.keymap.set("n", "k", "gk", { buffer = true, silent = true })
	end,
})
