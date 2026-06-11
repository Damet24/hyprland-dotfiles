local Config = require("core.config_loader")

Config.load_programs(require("config.programs"))
Config.load_env(require("config.env"))
Config.load_monitors(require("config.monitors"))
Config.load_settings(require("config.settings"))
Config.load_animations(require("config.animations"))
Config.load_layouts(require("config.layouts"))
Config.load_input(require("config.input"))
Config.load_autostart(require("config.autostart"))

local Binds = require("core.bind_manager")
Binds.register_plugin({ name = "System", keys = require("config.keybinds") })

local Plugins = require("core.loader")
Plugins.setup({ import = "plugins" })
Binds.apply()
