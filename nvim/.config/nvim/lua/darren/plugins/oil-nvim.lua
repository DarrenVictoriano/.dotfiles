return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional: for file icons
		config = function()
			local oil = require("oil")

			oil.setup({
				columns = { "icon" },
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
				},
				float = {
					padding = 2,
					max_width = 100,
					max_height = 30,
				},
				keymaps = {
					["<C-f>"] = "actions.telescope", -- Telescope find files in Oil's directory
				},
			})

			-- Open Oil in current file's directory
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory (Oil)" })

			-- Open Telescope from Oil's directory (works even outside of Oil buffers)
			vim.keymap.set("n", "<leader>fo", function()
				require("telescope.builtin").find_files({
					cwd = oil.get_current_dir(),
				})
			end, { desc = "Telescope [F]ind files from [O]il dir" })
		end,
	},
}
