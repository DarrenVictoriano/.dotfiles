return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }
				local telescope_builtin = require("telescope.builtin")

				-- set keybinds

				-- Jump to the definition of the word under your cursor.
				--  This is where a variable was first declared, or where a function is defined, etc.
				--  To jump back, press <C-t>.
				opts.desc = "Go to [D]efinition"
				keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts)

				-- Find references for the word under your cursor.
				opts.desc = "Go to [R]eferences"
				keymap.set("n", "gr", telescope_builtin.lsp_references, opts)

				-- Jump to the implementation of the word under your cursor.
				--  Useful when your language has ways of declaring types without an actual implementation.
				opts.desc = "Go to [I]implementation"
				keymap.set("n", "gi", telescope_builtin.lsp_implementations, opts)

				-- Jump to the type of the word under your cursor.
				--  Useful when you're not sure what type a variable is and you want to see
				--  the definition of its *type*, not where it was *defined*.
				opts.desc = "Go to [T]ype Definition"
				keymap.set("n", "gt", telescope_builtin.lsp_type_definitions, opts)

				-- show documentation for what is under cursor
				opts.desc = "Show do[K]umentation for what is under cursor"
				keymap.set("n", "gk", vim.lsp.buf.hover, opts)

				-- WARN: This is not Goto Definition, this is Goto Declaration.
				--  For example, in C this would take you to the header.
				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				-- Fuzzy find all the symbols in your current document.
				--  Symbols are things like variables, functions, types, etc.
				opts.desc = "Find Symbols for [C]urrent Document"
				keymap.set("n", "<leader>fvc", telescope_builtin.lsp_document_symbols, opts)

				-- Fuzzy find all the symbols in your current workspace.
				--  Similar to document symbols, except searches over your entire project.
				opts.desc = "Find Symbols for [W]orkspace"
				keymap.set("n", "<leader>fvw", telescope_builtin.lsp_dynamic_workspace_symbols, opts)

				-- show  diagnostics for file
				opts.desc = "Find Diagnostic for [C]urrent Buffer"
				keymap.set("n", "<leader>fdc", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				-- show diagnostics for line
				opts.desc = "Find [L]ine Diagnostics"
				keymap.set("n", "<leader>fdl", vim.diagnostic.open_float, opts)

				-- jump to previous diagnostic in buffer
				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "<leader>fdp", vim.diagnostic.goto_prev, opts)

				-- jump to next diagnostic in buffer
				opts.desc = "Go to next diagnostic"
				keymap.set("n", "<leader>fdn", vim.diagnostic.goto_next, opts)

				-- mapping to restart lsp if necessary
				opts.desc = "Restart L[S]P"
				keymap.set("n", "<leader>cs", ":LspRestart<CR>", opts)

				-- Rename the variable under your cursor.
				--  Most Language Servers support renaming across files, etc.
				opts.desc = "Smart [R]ename"
				keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				opts.desc = "See [A]vailable code actions"
				keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = ev.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = ev.buf,
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
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["pyright"] = function()
				-- configure lua server (with special settings)
				lspconfig["pyright"].setup({
					capabilities = capabilities,
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "openFilesOnly",
								useLibraryCodeForTypes = true,
							},
						},
					},
				})
			end,
		})
	end,
}
