return {
	"MeanderingProgrammer/render-markdown.nvim",
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	main = "render-markdown",
	name = "render-markdown",
	opts = {},
	config = function()
		local mk = require("render-markdown")
		mk.setup({
			heading = {
				enabled = false,
			},
		})
	end,
}
