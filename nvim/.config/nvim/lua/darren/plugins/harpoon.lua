return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "nvim-telescope/telescope.nvim", -- for Telescope integration
		},
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			-- Use Telescope to show harpoon menu with shortcut labels
			-- local function toggle_telescope(harpoon_files)
			-- 	local conf = require("telescope.config").values
			-- 	local file_paths = {}
			--
			-- 	-- Map harpoon slots to your shortcut keys
			-- 	local shortcut_labels = { "6", "5", "4", "3" }
			--
			-- 	for i, item in ipairs(harpoon_files.items) do
			-- 		local shortcut = shortcut_labels[i] or tostring(i)
			-- 		table.insert(file_paths, string.format("[%s] %s", shortcut, item.value))
			-- 	end
			--
			-- 	require("telescope.pickers")
			-- 		.new({}, {
			-- 			prompt_title = "Harpoon",
			-- 			finder = require("telescope.finders").new_table({
			-- 				results = file_paths,
			-- 				entry_maker = function(entry)
			-- 					return {
			-- 						value = entry,
			-- 						display = entry,
			-- 						ordinal = entry,
			-- 						path = entry:match("^%[.-%]%s(.+)$"), -- extract file path from "[x] path"
			-- 					}
			-- 				end,
			-- 			}),
			-- 			previewer = conf.file_previewer({}),
			-- 			sorter = conf.generic_sorter({}),
			-- 			attach_mappings = function(_, map)
			-- 				map("i", "<CR>", function(prompt_bufnr)
			-- 					local entry = require("telescope.actions.state").get_selected_entry()
			-- 					local file_path = entry.path
			-- 					require("telescope.actions").close(prompt_bufnr)
			-- 					vim.cmd("edit " .. vim.fn.fnameescape(file_path))
			-- 				end)
			-- 				return true
			-- 			end,
			-- 		})
			-- 		:find()
			-- end

			-- Key mappings
			vim.keymap.set("n", "<leader>hh", function()
				harpoon:list():add()
			end, { desc = "Harpoon Add File" })

			vim.keymap.set("n", "<leader>hl", function()
				-- toggle_telescope(harpoon:list())
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon Telescope Menu" })

			vim.keymap.set("n", "6", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon to File 6" })

			vim.keymap.set("n", "5", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon to File 5" })

			vim.keymap.set("n", "4", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon to File 4" })

			vim.keymap.set("n", "8", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon to File 8" })
		end,
	},
}
