-- Keyboard layout switcher
local wibox = require("wibox")
local awful = require("awful")
local lain = require("lain")

theme.widget_language = theme.dir .. "/icons/widgets/language.png"
local language_icon = wibox.widget.imagebox(theme.widget_language)
local kbd_widget = wibox.widget.textbox()
kbd_widget.border_width = 0
kbd_widget.border_color = theme.bg_normal
kbd_widget.font = theme.font

local kbdstrings = { [0] = " us ", [1] = " fr " }
local current_layout = 0

-- Function to update the keyboard layout widget
local function update_kbd_widget()
	kbd_widget:set_markup("<span foreground=" .. "'" .. theme.fg_widget .. "'" .. ">" .. kbdstrings[current_layout] .. "</span>")
end

-- Function to switch the keyboard layout
local function switch_kbd_layout()
	current_layout = 1 - current_layout
	-- awful.spawn.with_shell("setxkbmap -layout us,fr -option grp:alt_shift_toggle")
  awful.spawn.with_shell("setxkbmap " .. kbdstrings[current_layout]:match("%S+"))
	-- Update the widget after switching the layout
	update_kbd_widget()
end

-- Initial layout
update_kbd_widget()

-- Add right-click functionality to switch keyboard layout
kbd_widget:buttons(awful.util.table.join(
	awful.button({}, 3, function()
		switch_kbd_layout()
	end)
))

local kbd_widget_container = wibox.container.background(
	wibox.container.margin(wibox.widget({ language_icon, kbd_widget, layout = wibox.layout.align.horizontal }), 0, 0, 0, 0),
	theme.green
)

return kbd_widget_container