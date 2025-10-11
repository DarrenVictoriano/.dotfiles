return {
	"folke/flash.nvim",
  keys = {
    {"<c-s>", mode = {"c"}, false },
    {"<c-space>", mode = {"n", "o", "x"}, false },
    { "<c-f>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
