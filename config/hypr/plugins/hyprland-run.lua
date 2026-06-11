return {
    name = "hyprland-run",
    description = "Hyprland-run launcher popup",

    rules = {
        {
            match = { class = "hyprland-run" },
            float = true,
            move = "20 monitor_h-120",
        },
    },
}
