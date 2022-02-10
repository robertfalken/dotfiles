return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "moon",
			styles = {
				comments = { italic = true },
			},
			on_colors = function(colors)
				colors.border = colors.green2
			end,
		})
		vim.cmd([[colorscheme tokyonight-moon]])
	end,
}
