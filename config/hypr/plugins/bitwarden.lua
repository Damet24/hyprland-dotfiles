return {
    name = "bitwarden",
    description = "Bitwarden browser extension popup",

    rules = {
        {
            name = "bitwarden-login-float",
            match = {
                class = "^app%.zen_browser%.zen$",
                title = "^(Extension:.*Bitwarden.*)$",
            },
            float = true,
            center = true,
        },
    },
}
