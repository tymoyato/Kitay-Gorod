local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local naughty = require("naughty")

local package_log_widget = {}

-- Path to the package log file
local log_file = os.getenv("HOME") .. "/.Kitay-Gorod/linux/package_updates.log"

-- Function to strip ANSI color codes and format text
local function strip_colors_and_format(text)
    -- Remove ANSI color codes
    text = text:gsub("\27%[%d+;?%d*;?%d*;?%d*;?%d*m", "")
    -- Remove common shell symbols and replace with text
    text = text:gsub("ℹ", "INFO:")
    text = text:gsub("✓", "✓")
    text = text:gsub("⚠", "⚠")
    text = text:gsub("✗", "✗")
    text = text:gsub("📋", "CHANGELOG:")
    text = text:gsub("🔍", "DETAILED:")
    text = text:gsub("⚠️", "WARNING:")
    return text
end

-- Function to read the last N lines from the log file
local function read_last_lines(file_path, num_lines)
    local lines = {}
    local file = io.open(file_path, "r")
    if not file then
        return {"Log file not found"}
    end
    
    for line in file:lines() do
        -- Strip colors and format the line
        local clean_line = strip_colors_and_format(line)
        table.insert(lines, clean_line)
        if #lines > num_lines then
            table.remove(lines, 1)
        end
    end
    file:close()
    
    if #lines == 0 then
        return {"No package updates logged"}
    end
    
    return lines
end

-- Function to show package log notification
local function show_package_log()
    local lines = read_last_lines(log_file, 20)
    local content = table.concat(lines, "\n")
    
    naughty.notify({
        title = "📦 Package Updates Log",
        text = content,
        timeout = 15, -- Auto-dismiss after 15 seconds
        width = 700,
        height = 500,
        position = "top_right",
        fg = "#FFD700", -- Gold text
        bg = "#1a1a1a", -- Dark background
        border_color = "#DC143C", -- Crimson red border
        border_width = 2,
        dismiss_on_click = true, -- Dismiss when clicked
        font = "Meslo LGS Regular 10", -- Use monospace font for better formatting
    })
end

-- Create the widget
local widget_text = wibox.widget.textbox("📦")
widget_text.font = "Meslo LGS Regular 10"

-- Add click and hover events
widget_text:connect_signal("button::press", function(_, _, _, button)
    if button == 1 then -- Left click
        show_package_log()
    end
end)

-- Add hover tooltip
widget_text:connect_signal("mouse::enter", function()
    show_package_log()
end)

package_log_widget.widget = widget_text

return package_log_widget 