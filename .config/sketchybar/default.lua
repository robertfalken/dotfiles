local settings = require("settings")
local colors = require("colors")

-- Equivalent to the --default domain
sbar.default({
	updates = "when_shown",
	icon = {
		font = {
			family = settings.font.icon,
			style = "Bold",
			size = 18.0,
		},
		color = colors.text,
		padding_left = settings.padding * 2,
		padding_right = settings.padding,
	},
	label = {
		font = {
			family = settings.font.text,
			style = "Bold",
			size = 14.0,
		},
		color = colors.text,
		padding_left = settings.padding,
		padding_right = settings.padding * 2,
	},
	background = {
		height = 32,
		corner_radius = 9,
		border_width = 2,
	},
	padding_left = 5,
	padding_right = 5,
})
