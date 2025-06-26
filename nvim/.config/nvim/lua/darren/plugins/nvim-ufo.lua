-- ~/.config/nvim/lua/plugins/nvim-ufo.lua
return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = "BufReadPost",
	config = function()
		local ufo = require("ufo")

		ufo.setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "lsp", "indent" }
			end,
		})

		-- Disable automatic folding on file open
		vim.api.nvim_create_autocmd("BufReadPost", {
			pattern = "*",
			callback = function()
				-- Enable folding manually only when required
				vim.wo.foldenable = false
				-- Set foldmethod to 'indent' or 'expr' for more control over folds by levels
				vim.wo.foldmethod = "indent" -- or "expr" for custom folding logic
				vim.wo.foldlevel = 99 -- Set the max fold level to unfold all when needed
			end,
		})

		-- Disable automatic folding when switching to Normal mode
		vim.api.nvim_create_autocmd("InsertLeave", {
			pattern = "*",
			callback = function()
				vim.wo.foldenable = false
			end,
		})

		-- Allow manual folding by setting foldenable back to true when needed
		vim.keymap.set("n", "zR", function()
			vim.wo.foldenable = true -- Enable folding
			ufo.openAllFolds()
		end, { desc = "Open all folds" })

		vim.keymap.set("n", "zM", function()
			vim.wo.foldenable = true -- Enable folding
			ufo.closeFoldsWith(1) -- Close folds with level 1, change as needed
		end, { desc = "Close all folds with level" })

		vim.keymap.set("n", "zr", function()
			vim.wo.foldenable = true -- Enable folding
			ufo.openFoldsExceptKinds()
		end, { desc = "Open folds except some kinds" })

		vim.keymap.set("n", "zm", function()
			vim.wo.foldenable = true -- Enable folding
			ufo.closeFoldsWith(2) -- This will close folds at level 2 (or other levels as needed)
		end, { desc = "Close folds with level" })
	end,
}
