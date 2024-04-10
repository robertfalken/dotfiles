local icons = require("icons")
local colors = require("colors")
local settings = require("settings")
local theme = require("theme")

sbar.add("item", { position = "right", width = settings.spacing })

local volume = sbar.add("item", {
	position = "right",
	background = theme.bracket.background,
	icon = {
		string = icons.volume._10,
		padding_right = settings.padding * 2,
	},
})

volume:subscribe("volume_change", function(env)
	local percentage = tonumber(env.INFO)
	local icon = icons.volume._0
	local color = colors.gold
	local background = theme.bracket.background

	if percentage > 60 then
		icon = icons.volume._100
	elseif percentage > 30 then
		icon = icons.volume._66
	elseif percentage > 10 then
		icon = icons.volume._33
	elseif percentage > 0 then
		icon = icons.volume._10
	end

	local text = percentage .. "%"
	local drawing = true
	if percentage == 0 then
		color = colors.base
		background = colors.love
		drawing = false
	else
		color = colors.foam
		background = colors.overlay
		drawing = true
	end

	volume:set({
		background = { color = background },
		label = { string = text, drawing = drawing },
		icon = { string = icon, color = color },
	})
end)
