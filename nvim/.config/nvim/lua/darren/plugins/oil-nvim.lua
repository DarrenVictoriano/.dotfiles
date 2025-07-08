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
				keymaps = {},
			})

			-- Open Oil in current file's directory
			vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory (Oil)" })
		end,
	},
}
