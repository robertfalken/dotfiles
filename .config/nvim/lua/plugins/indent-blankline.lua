return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		local colors = require("rose-pine.palette")
		local highlight = { "IndentBlankLine" }
		local hooks = require("ibl.hooks")

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "IndentBlankLine", { fg = colors.highlight_med })
			vim.api.nvim_set_hl(0, "IndentBlankLineScope", { fg = colors.muted })
		end)

		require("ibl").setup({
			indent = { highlight = highlight },
			scope = {
				highlight = { "IndentBlankLineScope" },
				show_start = false,
				show_end = false,
			},
		})
	end,
}
