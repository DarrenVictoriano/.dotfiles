return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		-- Set the sessionoptions
		vim.opt.sessionoptions = {
			"blank",
			"buffers",
			"curdir",
			"folds",
			"help",
			"tabpages",
			"winsize",
			"winpos",
			"terminal",
			"localoptions",
		}
		auto_session.setup({
			auto_restore = false,
			suppressed_dirs = { "~/", "~/code/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "[R]estore session for cwd" }) -- restore last workspace session for current directory
		keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "[S]ave session for auto session root dir" }) -- save workspace session for current working directory
	end,
}
