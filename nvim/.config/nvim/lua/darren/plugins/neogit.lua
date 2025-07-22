return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = function()
		local neogit = require("neogit")
		local keymap = vim.keymap
		neogit.setup({})

		-- General Neogit Keymaps
		keymap.set("n", "<leader>gs", neogit.open, { desc = "Neogit Status", silent = true, noremap = true })
		keymap.set("n", "<leader>gc", ":Neogit commit<CR>", { desc = "Neogit Commit", silent = true, noremap = true })
		keymap.set("n", "<leader>gp", ":Neogit pull<CR>", { desc = "Neogit Pull", silent = true, noremap = true })
		keymap.set("n", "<leader>gP", ":Neogit push<CR>", { desc = "Neogit Push", silent = true, noremap = true })

		-- Merge conflict resolution keymaps
		keymap.set(
			"n",
			"<leader>gd",
			":DiffviewOpen<CR>",
			{ desc = "Open Diffview in new tab", silent = true, noremap = true }
		)
		keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", { desc = "Close Diffview", silent = true, noremap = true })

		-- Optional: keymaps for navigating and choosing conflict hunks
		keymap.set("n", "<leader>go", "]c", { desc = "Next conflict", silent = true, noremap = true })
		keymap.set("n", "<leader>gO", "[c", { desc = "Previous conflict", silent = true, noremap = true })
		keymap.set(
			"n",
			"<leader>gl",
			":diffget //2<CR>",
			{ desc = "Choose local version", silent = true, noremap = true }
		)
		-- keymap.set("n", "<leader>gb", ":diffget //3<CR>", { desc = "Choose base version", silent = true, noremap = true })
		keymap.set(
			"n",
			"<leader>gh",
			":diffget //4<CR>",
			{ desc = "Choose remote version", silent = true, noremap = true }
		)
	end,
}
