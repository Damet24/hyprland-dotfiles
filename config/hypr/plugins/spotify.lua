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
}
