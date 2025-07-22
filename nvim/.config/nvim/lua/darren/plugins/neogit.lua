return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
		"tpope/vim-fugitive",
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup({})

		-- General Neogit Keymaps
		vim.keymap.set("n", "<leader>gs", function()
			neogit.open()
		end, { desc = "Neogit Status" })

		-- Merge conflict resolution keymaps
		vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Open Diffview in new tab" })
		vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", { desc = "Close Diffview" })
		vim.keymap.set("n", "<leader>gm", ":Gvdiffsplit!<CR>", { desc = "Open Git diff for merge conflict" })
		vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>", { desc = "Open Git diff for merge conflict" })

		-- Optional: keymaps for navigating and choosing conflict hunks
		vim.keymap.set("n", "<leader>go", "]c", { desc = "Next conflict" })
		vim.keymap.set("n", "<leader>gO", "[c", { desc = "Previous conflict" })
		vim.keymap.set("n", "<leader>gl", ":diffget //2<CR>", { desc = "Choose local version" })
		vim.keymap.set("n", "<leader>gb", ":diffget //3<CR>", { desc = "Choose base version" })
		vim.keymap.set("n", "<leader>gh", ":diffget //4<CR>", { desc = "Choose remote version" })
	end,
}
