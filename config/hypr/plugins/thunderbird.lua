return {
	name = "thunderbird",
	description = "Thunderbird desktop client",

	rules = {
		{
			match = { class = "net.thunderbird.Thunderbird" },
			workspace = "5",
		},
	},

	keys = {
		{
			key = "T",
			mod = "SUPER",
			action = hl.dsp.exec_cmd("flatpak run net.thunderbird.Thunderbird"),
			desc = "Open Thunderbird",
			category = "Applications",
		},
	},
}
