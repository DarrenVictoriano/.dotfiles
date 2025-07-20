return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		symbol_folding = {
			-- Unfold entire symbol tree by default with false, otherwise enter a
			-- number starting from 1
			autofold_depth = false,
			-- autofold_depth = 1,
		},
		outline_window = {
			-- Percentage or integer of columns
			width = 33,
		},
	},
	config = function(_, opts)
		require("outline").setup(opts)

		-- Disable folding in the outline window
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "Outline",
			callback = function()
				vim.wo.foldenable = false
				-- vim.wo.foldlevel = 99
			end,
		})

		-- Force open all sysmbol folds after outline opens
		-- vim.api.nvim_create_autocmd("User", {
		-- 	pattern = "OutlineOpen",
		-- 	callback = function()
		-- 		vim.defer_fn(function()
		-- 			vim.cmd.normal("zR")
		-- 		end, 50)
		-- 	end,
		-- })
	end,
}
