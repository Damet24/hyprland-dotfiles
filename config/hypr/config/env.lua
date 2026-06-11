local p = require("config.programs")

return {
	{ var = "XCURSOR_SIZE", value = "24" },
	{ var = "HYPRCURSOR_SIZE", value = "24" },
	{ var = "EDITOR", value = p.editor },
	{ var = "TERMINAL", value = p.terminal },
}
