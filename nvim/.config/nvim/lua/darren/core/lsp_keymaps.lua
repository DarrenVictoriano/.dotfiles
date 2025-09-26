local M = {}

function M.on_attach(client, bufnr)
	local keymap = vim.keymap -- for conciseness
	local telescope_builtin = require("telescope.builtin")

	-- Buffer local mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local opts = { buffer = bufnr, silent = true }

	-- set keybinds

	-- Jump to the definition of the word under your cursor.
	opts.desc = "Go to [D]efinition"
	keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts)

	-- Find references for the word under your cursor.
	opts.desc = "Go to [R]eferences"
	keymap.set("n", "gr", telescope_builtin.lsp_references, opts)

	-- Jump to the implementation of the word under yourcursor.
	opts.desc = "Go to [I]implementation"
	keymap.set("n", "gi", telescope_builtin.lsp_implementations, opts)

	-- Jump to the type of the word under your cursor.
	opts.desc = "Go to [T]ype Definition"
	keymap.set("n", "gt", telescope_builtin.lsp_type_definitions, opts)

	-- show documentation for what is under cursor
	opts.desc = "Show do[K]umentation for what is under cursor"
	keymap.set("n", "gk", vim.lsp.buf.hover, opts)

	-- WARN: This is not Goto Definition, this is Goto Declaration.
	opts.desc = "Go to declaration"
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

	-- Fuzzy find all the symbols in your current document.
	opts.desc = "Find Symbols for [C]urrent Document"
	keymap.set("n", "<leader>fvc", telescope_builtin.lsp_document_symbols, opts)

	-- Fuzzy find all the symbols in your current workspace.
	opts.desc = "Find Symbols for [W]orkspace"
	keymap.set("n", "<leader>fvw", telescope_builtin.lsp_dynamic_workspace_symbols, opts)

	-- show  diagnostics for file
	opts.desc = "Find Diagnostic for [C]urrent Buffer"
	keymap.set("n", "<leader>fdc", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

	-- show diagnostics for line
	opts.desc = "Show Line Diagnostics"
	keymap.set("n", "<leader>xK", vim.diagnostic.open_float, opts)

	-- jump to previous diagnostic in buffer
	opts.desc = "Go to previous diagnostic"
	keymap.set("n", "<leader>xp", vim.diagnostic.goto_prev, opts)

	-- jump to next diagnostic in buffer
	opts.desc = "Go to next diagnostic"
	keymap.set("n", "<leader>xn", vim.diagnostic.goto_next, opts)

	-- mapping to restart lsp if necessary
	opts.desc = "Restart L[S]P"
	keymap.set("n", "<leader>cs", ":LspRestart<CR>", opts)

	-- Rename the variable under your cursor.
	opts.desc = "Smart [R]ename"
	keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

	-- Execute a code action, usually your cursor needs to be on top of an error
	opts.desc = "See [A]vailable code actions"
	keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, opts)

	-- The following two autocommands are used to highlight references of the
	-- word under your cursor when your cursor rests there for a little while.
	if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
		local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = bufnr,
			group = highlight_augroup,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = bufnr,
			group = highlight_augroup,
			callback = vim.lsp.buf.clear_references,
		})

		vim.api.nvim_create_autocmd("LspDetach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
			callback = function(event2)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
			end,
		})
	end
end

return M