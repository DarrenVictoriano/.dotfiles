return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		icons = {
			-- set icon mappings to true if you have a Nerd Font
			mappings = vim.g.have_nerd_font,
			-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
			-- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
			keys = vim.g.have_nerd_font and {} or {
				Up = "<Up> ",
				Down = "<Down> ",
				Left = "<Left> ",
				Right = "<Right> ",
				C = "<C-…> ",
				M = "<M-…> ",
				D = "<D-…> ",
				S = "<S-…> ",
				CR = "<CR> ",
				Esc = "<Esc> ",
				ScrollWheelDown = "<ScrollWheelDown> ",
				ScrollWheelUp = "<ScrollWheelUp> ",
				NL = "<NL> ",
				BS = "<BS> ",
				Space = "<Space> ",
				Tab = "<Tab> ",
				F1 = "<F1>",
				F2 = "<F2>",
				F3 = "<F3>",
				F4 = "<F4>",
				F5 = "<F5>",
				F6 = "<F6>",
				F7 = "<F7>",
				F8 = "<F8>",
				F9 = "<F9>",
				F10 = "<F10>",
				F11 = "<F11>",
				F12 = "<F12>",
			},
		},
		-- Document existing key chains
		spec = {
			-- { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
			-- { '<leader>d', group = '[D]ocument' },
			{ "<leader>e", group = "[E]xplore" },
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>h", group = "[H]unk Gitsigns" },
			{ "<leader>w", group = "[W]indows" },
			{ "<leader>t", group = "[T]abs" },
			{ "<leader>c", group = "[C]ommands" },
			{ "<leader>s", group = "[S]essions" },
			{ "<leader>x", group = "[X]Trouble" },
			{ "<leader>fd", group = "Find [D]iagnostics" },
			{ "<leader>fv", group = "Find [V]ariables or Symbols" },
			-- { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
		},
		keys = {
			scroll_down = "<c-j>", -- binding to scroll down inside the popup
			scroll_up = "<c-k>", -- binding to scroll up inside the popup
		},
		layout = {
			width = { min = 20 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
		},
		win = {
			-- width = 1,
			height = { min = 4, max = 35 },
			-- col = 0,
			title = true,
			title_pos = "center",
		},
	},
}
