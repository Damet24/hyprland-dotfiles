hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	match = { class = "com.wayle.settings" },
	float = true,
})

hl.window_rule({
	name = "bitwarden-login-float",
	match = {
		class = "^app\\.zen_browser\\.zen$",
		title = "^(Extension:.*Bitwarden.*)$",
	},
	float = true,
	center = true,
})

for i = 1, 5 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "DP-1",
		persistent = true,
	})
end

for i = 6, 10 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "HDMI-A-1",
		persistent = true,
	})
end

hl.window_rule({
	match = {
		class = "kitty",
	},
})
