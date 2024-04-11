local icons = require("icons")
local colors = require("colors")
local settings = require("settings")
local theme = require("theme")

local clock = sbar.add("item", {
	padding_left = 0,
	icon = { drawing = false },
	label = {
		font = {
			style = "Semibold",
		},
	},
	position = "right",
	update_freq = 15,
})

local calendar = sbar.add("item", {
	icon = { drawing = false },
	padding_right = 0,
	position = "right",
	update_freq = 15,
})

sbar.add("bracket", { clock.name, calendar.name }, {
	background = theme.bracket.background,
})

local function update_time()
	local time = os.date("%H:%M")
	clock:set({ label = time })
end

local function update_date()
	local date = os.date("%a %d %b")
	calendar:set({ label = date })
end

clock:subscribe("routine", update_time)
clock:subscribe("forced", update_time)
calendar:subscribe("routine", update_date)
calendar:subscribe("forced", update_date)
