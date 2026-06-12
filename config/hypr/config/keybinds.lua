local p = require("config.programs")
local mod = "SUPER"

local keys = {
	-- Launch
	{ key = "Return", action = hl.dsp.exec_cmd(p.terminal), desc = "Open terminal", category = "Launch" },
	{
		key = "Space",
		mod = "ALT",
		action = hl.dsp.exec_cmd(p.menu),
		desc = "App launcher",
		category = "Launch",
	},
	{ key = "E", action = hl.dsp.exec_cmd(p.fileManager), desc = "Open file manager", category = "Launch" },
	{ key = "R", action = hl.dsp.exec_cmd(p.menu), desc = "App launcher (alt)", category = "Launch" },

	-- System
	{ key = "W", action = hl.dsp.window.close(), desc = "Close window", category = "Windows" },
	{ key = "Escape", action = hl.dsp.exec_cmd("hyprlock"), desc = "Lock screen", category = "System" },
	{
		key = "M",
		action = hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"),
		desc = "Shutdown Hyprland",
		category = "System",
	},

	-- Window management
	{
		key = "V",
		action = hl.dsp.window.float({ action = "toggle" }),
		desc = "Toggle float",
		category = "Windows",
	},
	{
		key = "P",
		action = hl.dsp.window.pseudo(),
		desc = "Toggle pseudo-tiling",
		category = "Windows",
	},
	{
		key = "J",
		action = hl.dsp.layout("togglesplit"),
		desc = "Toggle split layout",
		category = "Layout",
	},

	-- Focus / navigation
	{ key = "left", action = hl.dsp.focus({ direction = "left" }), desc = "Focus left", category = "Navigation" },
	{ key = "right", action = hl.dsp.focus({ direction = "right" }), desc = "Focus right", category = "Navigation" },
	{ key = "up", action = hl.dsp.focus({ direction = "up" }), desc = "Focus up", category = "Navigation" },
	{ key = "down", action = hl.dsp.focus({ direction = "down" }), desc = "Focus down", category = "Navigation" },

	-- Special workspace
	{
		key = "S",
		mods = { mod, "SHIFT" },
		action = hl.dsp.window.move({ workspace = "special:magic" }),
		desc = "Move window to special workspace",
		category = "Workspace",
	},

	-- Scroll / mouse
	{
		key = "mouse_down",
		mod = mod,
		action = hl.dsp.focus({ workspace = "e+1" }),
		desc = "Next workspace",
		category = "Workspace",
	},
	{
		key = "mouse_up",
		mod = mod,
		action = hl.dsp.focus({ workspace = "e-1" }),
		desc = "Previous workspace",
		category = "Workspace",
	},
	{
		key = "mouse:272",
		mod = mod,
		action = hl.dsp.window.drag(),
		opts = { mouse = true },
		desc = "Drag window",
		category = "Mouse",
	},
	{
		key = "mouse:273",
		mod = mod,
		action = hl.dsp.window.resize(),
		opts = { mouse = true },
		desc = "Resize window",
		category = "Mouse",
	},
}

-- Workspace switching
for i = 1, 10 do
	local k = i % 10
	table.insert(keys, {
		key = tostring(k),
		action = hl.dsp.focus({ workspace = i }),
		desc = "Focus workspace " .. i,
		category = "Workspace",
	})
	table.insert(keys, {
		key = tostring(k),
		mods = { mod, "SHIFT" },
		action = hl.dsp.window.move({ workspace = i }),
		desc = "Move window to workspace " .. i,
		category = "Workspace",
	})
end

return keys
