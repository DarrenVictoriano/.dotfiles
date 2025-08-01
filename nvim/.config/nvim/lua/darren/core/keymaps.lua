-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

local keymap = vim.keymap

--------------------- General Keymaps ---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Move by visual line if no count is given
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- use Enter instead of za to fold text
keymap.set("n", "<CR>", "za", { noremap = true, silent = true })

-- clear search highlights
keymap.set("n", "<leader>ch", ":nohl<CR>", { desc = "Clear search [H]ighlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>w|", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>w-", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wd", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>wx", "<cmd>bwipeout<CR>", { desc = "Close current buffer" }) -- close current split window

-- save and quit buffer
keymap.set("n", "<leader>ws", ":w<CR>", { desc = "Save Buffer" })
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and Quit Buffer" })
keymap.set("n", "<leader>qq", ":wqa<CR>", { desc = "Save and Quit All" })

-- tab management
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>bwipeout<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab

-- buffer management
keymap.set("n", "L", "<cmd>bnext<CR>", { desc = "Go to next buffer", noremap = true })
keymap.set("n", "H", "<cmd>bprevious<CR>", { desc = "Go to previous buffer", noremap = true })

-- scroll half screen and center
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half screen" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half screen" })

-- scroll one full screen and center
keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Move down one full screen" })
keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Move down one full screen" })

-- Search next/prev and center + open folds
keymap.set("n", "n", "nzzzv", { desc = "Search next and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Search previous and center" })
