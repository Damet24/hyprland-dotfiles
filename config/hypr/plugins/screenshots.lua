local path = "$HOME/Pictures/Screenshots"
local programs = require("config/programs")

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
		{
			key = "F9",
			mod = "SUPER",
			action = hl.dsp.exec_cmd(
				'grim -g "$(slurp)" /tmp/qrcode && wl-copy $(zbarimg /tmp/qrcode -q --raw) -p && '
					.. programs.browser
					.. " $(wl-paste -p)"
			),
			desc = "Scna a qr code from screenshot",
			category = "Screenshots",
		},
	},
}
