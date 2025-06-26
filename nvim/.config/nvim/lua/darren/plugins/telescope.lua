return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local telescopeConfig = require("telescope.config")
		local actions = require("telescope.actions")

		-- Clone the default Telescope configuration
		local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

		-- I want to search in hidden/dot files.
		table.insert(vimgrep_arguments, "--hidden")
		-- I don't want to search in the `.git` directory.
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		telescope.setup({
			defaults = {
				vimgrep_arguments = vimgrep_arguments,
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		local builtin = require("telescope.builtin")

		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find [H]elp" })
		keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find [K]eymaps" })
		keymap.set("n", "<leader>fp", builtin.builtin, { desc = "Find Builtin [P]ickers" })
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find [F]iles" })
		keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "Find [S]tring Current Buffer" })
		keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find current [W]ord" })
		keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by [G]rep" })
		keymap.set("n", "<leader>fdw", builtin.diagnostics, { desc = "Find Diagnostics for [W]orkspace" })
		keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find [R]esume" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find [T]odo Comments" })
		keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = 'Find Recent Files ("." for repeat)' })
		keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		-- Shortcut for searching your Neovim configuration files
		keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[F]ind [N]eovim files" })
	end,
}
