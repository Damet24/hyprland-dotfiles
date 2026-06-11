local path = "$HOME/Pictures/Screenshots"

return {
	name = "screenshots",
	description = "Screenshot keybinds using hyprshot",
	dependencies = { "hyprshot" },

	keys = {
		{
			key = "F10",
			mod = "SUPER",
			action = hl.dsp.exec_cmd("hyprshot -m window -o " .. path),
			desc = "Screenshot window",
			category = "Screenshots",
		},
		{
			key = "F11",
			mod = "SUPER",
			action = hl.dsp.exec_cmd("hyprshot -m output -o " .. path),
			desc = "Screenshot monitor",
			category = "Screenshots",
		},
		{
			key = "F12",
			mod = "SUPER",
			action = hl.dsp.exec_cmd("hyprshot -m region -o " .. path),
			desc = "Screenshot region",
			category = "Screenshots",
		},
	},
}
