local colors = require("colors")
local icons = require("icons")
local theme = require("theme")

sbar.add("event", "keyboard_layout_change", "AppleSelectedInputSourcesChangedNotification")

local item = sbar.add("item", {
	position = "right",
	icon = {
		string = icons.keyboard,
		font = "Hack Nerd Font:Bold:20.0",
		color = colors.text,
	},
	label = {
		drawing = true,
		font = {
			style = "Bold",
		},
	},
})

local layouts = {
	["U.S."] = {
		label = "US",
		icon = {
			color = colors.pine,
		},
	},
	["Swedish - Pro"] = {
		label = "SE",
		icon = {
			color = colors.gold,
		},
	},
}

sbar.add("bracket", { item.name }, {
	background = theme.bracket.background,
})

local function update()
	sbar.exec(
		'defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep "KeyboardLayout Name" | cut -d \'"\' -f4',
		function(output)
			local layout = layouts[output:gsub("\n", "")]
			item:set(layout)
		end
	)
end

item:subscribe("keyboard_layout_change", update)
update()
