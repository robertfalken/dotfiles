local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local theme = require("theme")

sbar.add("item", {
	width = 24,
})

local front_app = sbar.add("item", {
	padding_left = 3,
	icon = {
		drawing = true,
		padding_left = settings.padding,
		background = {
			corner_radius = 6,
			color = colors.pine,
			height = 26,
		},
	},
	label = {
		padding_left = settings.padding * 2,
	},
})

local yabai_float = sbar.add("item", {
	background = {
		padding_right = 0,
	},
	icon = {
		padding_right = 0,
		color = colors.muted,
		string = icons.window,
	},
})

local yabai_zoom = sbar.add("item", {
	padding_left = -18,
	y_offset = 6,
	background = {
		padding_right = 0,
	},
	label = { drawing = false },
	icon = {
		padding_right = 0,
		padding_left = 0,
		color = colors.gold,
		string = icons.yabai.zoomed,
		font = {
			size = 12,
		},
	},
})

sbar.add("bracket", { front_app.name, yabai_float.name, yabai_zoom.name }, theme.bracket)

local function update_yabai_float()
	sbar.exec("yabai -m query --windows --window | jq '.[\"is-floating\"]'", function(output)
		local op = output:gsub("\n", "")
		local is_floating = op == "true"

		local icon = ""
		if is_floating then
			icon = icons.yabai.floating
		else
			icon = icons.yabai.managed
		end

		yabai_float:set({
			icon = icon,
		})
	end)
end

local function update_yabai_zoom()
	sbar.exec("yabai -m query --windows --window | jq '.[\"has-parent-zoom\"]'", function(output)
		local op = output:gsub("\n", "")
		local is_zoomed = op == "true"
		local padding = is_zoomed and settings.padding * 2 or 0

		yabai_zoom:set({
			icon = {
				padding_right = padding,
				drawing = is_zoomed,
			},
		})
	end)
end

update_yabai_float()
update_yabai_zoom()

front_app:subscribe("yabai_float", update_yabai_float)
front_app:subscribe("yabai_zoom", update_yabai_zoom)

front_app:subscribe("front_app_switched", function(env)
	front_app:set({
		icon = {
			string = icons["apps"][env.INFO] or icons.window,
		},
		label = {
			string = env.INFO,
		},
	})
	update_yabai_zoom()
end)
