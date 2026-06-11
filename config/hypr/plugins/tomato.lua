return {
    name = "tomato",
    description = "Tomato terminal timer (ghostty)",

    rules = {
        {
            match = {
                class = "com.mitchellh.ghostty",
                title = "tomato",
                initial_title = "Ghostty",
            },
            workspace = "10",
            size = { 518, 555 },
            pseudo = true,
        },
    },
}
