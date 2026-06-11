return {
    name = "core",
    description = "Workspace layout and system-wide window rules",

    workspaces = {
        { monitor = "DP-1",     workspaces = { 1, 2, 3, 4, 5 } },
        { monitor = "HDMI-A-1", workspaces = { 6, 7, 8, 9, 10 } },
    },

    rules = {
        {
            name = "suppress-maximize-events",
            match = { class = ".*" },
            suppress_event = "maximize",
        },
        {
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
        },
    },
}
