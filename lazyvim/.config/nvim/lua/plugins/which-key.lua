return {
  "folke/which-key.nvim",
  opts = {
    win = {
      border = "single", -- could be "rounded", "shadow", "none", etc.
      padding = { 2, 2 }, -- top/bottom, left/right
    },
    spec = {
      -- { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      -- { '<leader>d', group = '[D]ocument' },
      { "<leader>e", group = "Explorer" },
      { "<leader>f", group = "Find" },
      { "<leader>h", group = "Harpoon" },
      { "<leader>g", group = "Git" },
      { "<leader>w", group = "Windows" },
      { "<leader>t", group = "Tabs" },
      { "<leader>c", group = "Commands" },
      { "<leader>s", group = "Sessions" },
      { "<leader>x", group = "Trouble" },
      { "<leader>fd", group = "Find Diagnostics" },
      { "<leader>fv", group = "Find Variables or Symbols" },
      -- { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
    keys = {
      scroll_down = "<c-j>", -- binding to scroll down inside the popup
      scroll_up = "<c-k>", -- binding to scroll up inside the popup
    },
  },
}
