return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup({})

		local function keymap(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { desc = desc, noremap = true, silent = true })
		end

		-- General Neogit Keymaps
		keymap("n", "<leader>gs", neogit.open, "Neogit Status")
		keymap("n", "<leader>gc", ":Neogit commit<CR>", "Neogit Commit")
		keymap("n", "<leader>gp", ":Neogit pull<CR>", "Neogit Pull")
		keymap("n", "<leader>gP", ":Neogit push<CR>", "Neogit Push")

		-- Merge conflict resolution keymaps
		keymap("n", "<leader>gd", ":DiffviewOpen<CR>", "Open Diffview in new tab")
		keymap("n", "<leader>gq", ":DiffviewClose<CR>", "Close Diffview")

		-- Optional: keymaps for navigating and choosing conflict hunks
		keymap("n", "<leader>gl", ":diffget //2<CR>", "Choose local version")
		-- keymap("n", "<leader>gb", ":diffget //3<CR>", "Choose base version")
		keymap("n", "<leader>gh", ":diffget //4<CR>", "Choose remote version")
	end,
}
