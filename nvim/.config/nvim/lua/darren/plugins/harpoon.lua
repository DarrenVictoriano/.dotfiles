return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim", -- for Telescope integration
		},
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			-- Use Telescope to show harpoon menu
			local function toggle_telescope(harpoon_files)
				local conf = require("telescope.config").values
				local file_paths = {}

				for i, item in ipairs(harpoon_files.items) do
					-- Format: "1: /path/to/file"
					table.insert(file_paths, string.format("%d: %s", i, item.value))
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
							entry_maker = function(entry)
								return {
									value = entry,
									display = entry,
									ordinal = entry,
									path = entry:match("^%d+: (.+)$"), -- extract actual file path
								}
							end,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
						attach_mappings = function(_, map)
							map("i", "<CR>", function(prompt_bufnr)
								local entry = require("telescope.actions.state").get_selected_entry()
								local file_path = entry.path
								require("telescope.actions").close(prompt_bufnr)
								vim.cmd("edit " .. vim.fn.fnameescape(file_path))
							end)
							return true
						end,
					})
					:find()
			end

			-- Key mappings
			vim.keymap.set("n", "<leader>hh", function()
				harpoon:list():add()
			end, { desc = "Harpoon Add File" })

			vim.keymap.set("n", "<leader>hl", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Harpoon Telescope Menu" })

			vim.keymap.set("n", "<leader>hf", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon to File 1" })

			vim.keymap.set("n", "<leader>hd", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon to File 2" })

			vim.keymap.set("n", "<leader>hs", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon to File 3" })

			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon to File 4" })
		end,
	},
}
