local colors = require("colors")
local icons = require("icons")
local theme = require("theme")

local function space_selection(env)
	local color = env.SELECTED == "true" and colors.white or colors.bg2

	sbar.set(env.NAME, {
		icon = { highlight = env.SELECTED },
		label = { highlight = env.SELECTED },
		background = { border_color = color },
	})
end

local spaces = {}
for i = 1, 10, 1 do
	local space = sbar.add("space", {
		associated_space = i,
		icon = {
			string = icons.spaces[i] or i,
			color = colors.text,
			highlight_color = colors.love,
			padding_right = 10,
		},
		label = {
			drawing = false,
		},
	})

	spaces[i] = space.name
	space:subscribe("space_change", space_selection)
end

sbar.add("bracket", spaces, theme.bracket)
