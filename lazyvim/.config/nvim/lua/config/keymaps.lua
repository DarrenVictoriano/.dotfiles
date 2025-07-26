-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Remove LazyVim's Better Up/Down keymaps
-- vim.keymap.del({ "n", "x" }, "j")
-- vim.keymap.del({ "n", "x" }, "<Down>")
-- vim.keymap.del({ "n", "x" }, "k")
-- vim.keymap.del({ "n", "x" }, "<Up>")

-- Remove LazyVim's Window Navigation keymaps
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")

-- Remove LazyVim's Window Resize keymaps
-- vim.keymap.del("n", "<C-Up>")
-- vim.keymap.del("n", "<C-Down>")
-- vim.keymap.del("n", "<C-Left>")
-- vim.keymap.del("n", "<C-Right>")

-- Remove LazyVim's Move Line keymaps
-- vim.keymap.del("n", "<A-j>")
-- vim.keymap.del("n", "<A-k>")
-- vim.keymap.del("i", "<A-j>")
-- vim.keymap.del("i", "<A-k>")
-- vim.keymap.del("v", "<A-j>")
-- vim.keymap.del("v", "<A-k>")

-- Remove LazyVim's Buffer keymaps
-- vim.keymap.del("n", "<S-h>")
-- vim.keymap.del("n", "<S-l>")
-- vim.keymap.del("n", "[b")
-- vim.keymap.del("n", "]b")
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>`")
vim.keymap.del("n", "<leader>bd")
vim.keymap.del("n", "<leader>bo")
vim.keymap.del("n", "<leader>bD")

-- Remove LazyVim's Escape enhancements
-- vim.keymap.del({ "i", "n", "s" }, "<esc>")

-- Remove LazyVim's Redraw / Clear hlsearch / Diff Update
vim.keymap.del("n", "<leader>ur")

-- Remove LazyVim's Better n/N search behavior
-- vim.keymap.del("n", "n")
-- vim.keymap.del("x", "n")
-- vim.keymap.del("o", "n")
-- vim.keymap.del("n", "N")
-- vim.keymap.del("x", "N")
-- vim.keymap.del("o", "N")

-- Remove LazyVim's Undo Breakpoints
-- vim.keymap.del("i", ",")
-- vim.keymap.del("i", ".")
-- vim.keymap.del("i", ";")

-- Remove LazyVim's Save keymap
-- vim.keymap.del({ "i", "x", "n", "s" }, "<C-s>")

-- Remove LazyVim's Keywordprg keymap
-- vim.keymap.del("n", "<leader>K")

-- Remove LazyVim's Better Indent keymaps
-- vim.keymap.del("v", "<")
-- vim.keymap.del("v", ">")

-- Remove LazyVim's Commenting keymaps
-- vim.keymap.del("n", "gco")
-- vim.keymap.del("n", "gcO")

-- Remove LazyVim's Lazy command
vim.keymap.del("n", "<leader>l")

-- Remove LazyVim's New File keymap
vim.keymap.del("n", "<leader>fn")

-- Remove LazyVim's Location List keymap
vim.keymap.del("n", "<leader>xl")

-- Remove LazyVim's Quickfix List keymaps
vim.keymap.del("n", "<leader>xq")
vim.keymap.del("n", "[q")
vim.keymap.del("n", "]q")

-- Remove LazyVim's Format keymap
vim.keymap.del({ "n", "v" }, "<leader>cf")

-- Remove LazyVim's Diagnostic keymaps
vim.keymap.del("n", "<leader>cd")
vim.keymap.del("n", "]d")
vim.keymap.del("n", "[d")
vim.keymap.del("n", "]e")
vim.keymap.del("n", "[e")
vim.keymap.del("n", "]w")
vim.keymap.del("n", "[w")

-- Remove LazyVim's Toggle Option keymaps
vim.keymap.del("n", "<leader>uf")
vim.keymap.del("n", "<leader>uF")
vim.keymap.del("n", "<leader>us")
vim.keymap.del("n", "<leader>uw")
vim.keymap.del("n", "<leader>uL")
vim.keymap.del("n", "<leader>ud")
vim.keymap.del("n", "<leader>ul")
vim.keymap.del("n", "<leader>uc")
vim.keymap.del("n", "<leader>uA")
vim.keymap.del("n", "<leader>uT")
vim.keymap.del("n", "<leader>ub")
vim.keymap.del("n", "<leader>uD")
vim.keymap.del("n", "<leader>ua")
vim.keymap.del("n", "<leader>ug")
vim.keymap.del("n", "<leader>uS")
vim.keymap.del("n", "<leader>dpp")
vim.keymap.del("n", "<leader>dph")
vim.keymap.del("n", "<leader>uh") -- if applicable

-- Remove LazyVim's Lazygit keymaps
vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>gf")
vim.keymap.del("n", "<leader>gl")
vim.keymap.del("n", "<leader>gL")
vim.keymap.del("n", "<leader>gb")
vim.keymap.del({ "n", "x" }, "<leader>gB")
vim.keymap.del({ "n", "x" }, "<leader>gY")

-- Remove LazyVim's Quit keymap
vim.keymap.del("n", "<leader>qq")

-- Remove LazyVim's Inspect keymaps
vim.keymap.del("n", "<leader>ui")
vim.keymap.del("n", "<leader>uI")

-- Remove LazyVim's Changelog keymap
vim.keymap.del("n", "<leader>L")

-- Remove LazyVim's Floating Terminal keymaps
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<c-/>")
vim.keymap.del("n", "<c-_>")

-- Remove LazyVim's Terminal Hide keymaps
vim.keymap.del("t", "<C-/>")
vim.keymap.del("t", "<c-_>")

-- Remove LazyVim's Window keymaps
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>wm")
vim.keymap.del("n", "<leader>uZ")
vim.keymap.del("n", "<leader>uz")

-- Remove LazyVim's Tab keymaps
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>o")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")

-- Remove LazyVim's Snippet Jump keymaps (for < 0.11)
if vim.fn.has("nvim-0.11") == 0 then
  vim.keymap.del("s", "<Tab>")
  vim.keymap.del({ "i", "s" }, "<S-Tab>")
end

-- My Custom Keymaps

local map = vim.keymap.set

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ch",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

