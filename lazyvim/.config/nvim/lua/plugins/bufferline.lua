return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      mode = "buffers",
      separator_style = "slant",
    },
  },
  keys = function()
    return {
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    }
  end,
}
