local Binds = require("core.bind_manager")
local Menu = require("ui.menu")

return {
	name = "help",
	description = "Searchable keybinding cheatsheet",

	keys = {
		{
			key = "H",
			mod = "SUPER",
			desc = "Show keybinding cheatsheet",
			category = "Help",
			action = function()
				local groups = Binds.export()
				local items = {}

				local sorted = {}
				for name, _ in pairs(groups) do
					table.insert(sorted, name)
				end
				table.sort(sorted)

				for _, name in ipairs(sorted) do
					table.insert(items, "[" .. name:upper() .. "]")
					for _, b in ipairs(groups[name]) do
						table.insert(items, string.format("  %-50s %s", b.desc, b.combo))
					end
					table.insert(items, "")
				end

				Menu.show_menu({ title = "Keybinds", items = items })
			end,
		},
	},
}
