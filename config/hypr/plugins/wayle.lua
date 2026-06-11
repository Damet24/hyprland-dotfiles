return {
    name = "wayle",
    description = "Wayle panel settings window",

    rules = {
        {
            match = { class = "com.wayle.settings" },
            float = true,
        },
    },

    keys = {
        { key = "F1", mod = "SUPER", action = hl.dsp.exec_cmd("wayle panel settings"), desc = "Wayle panel settings", category = "System" },
    },
}
