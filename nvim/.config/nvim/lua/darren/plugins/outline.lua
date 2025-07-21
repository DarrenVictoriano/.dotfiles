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

		-- Automatically close the Outline window when cursor leaves it
		vim.api.nvim_create_autocmd("WinLeave", {
			pattern = "*",
			callback = function(args)
				local buftype = vim.api.nvim_buf_get_option(args.buf, "filetype")
				if buftype == "Outline" then
					-- Delay to avoid interrupting the jump to the target symbol
					vim.defer_fn(function()
						local wins = vim.api.nvim_list_wins()
						for _, win in ipairs(wins) do
							local buf = vim.api.nvim_win_get_buf(win)
							if vim.api.nvim_buf_get_option(buf, "filetype") == "Outline" then
								vim.api.nvim_win_close(win, true)
							end
						end
					end, 100)
				end
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
