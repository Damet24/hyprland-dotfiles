return {
	name = "spotify",
	description = "Desktop Spotify client",

	rules = {
		{
			match = { class = "spotify" },
			workspace = "10",
			size = { 1000, 792 },
			pseudo = true,
		},
	},

	keys = {
		{
			key = "S",
			mod = "SUPER",
			desc = "Open Spotify App",
			category = "Applications",
			action = hl.dsp.exec_cmd("flatpak run com.spotify.Client"),
		},
	},
}
