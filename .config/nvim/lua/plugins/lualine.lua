return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"arkav/lualine-lsp-progress",
	},
	config = function()
		local icons = require("ui.icons")
		local colors = require("ui.colors")
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",

				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					{
						"diff",
						diff_color = {
							added = { fg = colors.teal },
							modified = { fg = colors.orange },
							removed = { fg = colors.red },
						},
						symbols = {
							added = icons.squared.plus .. " ",
							modified = icons.squared.dot .. " ",
							removed = icons.squared.minus .. " ",
						},
					},
				},
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = icons.diagnostics.error .. " ",
							warn = icons.diagnostics.warning .. " ",
							info = icons.diagnostics.information .. " ",
							hint = icons.diagnostics.hint .. " ",
						},
					},
					{
						"lsp_progress",
						timer = { spinner = 100 },
						spinner_symbols = {
							" ",
							" ",
							" ",
							" ",
							" ",
							" ",
							" ",
							" ",
						},
					},
				},
				lualine_x = { "filetype" },
				lualine_y = { "filename" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
