local rules = {}

local M = {}

function M.register(spec, plugin_name)
	spec.plugin = plugin_name
	table.insert(rules, spec)
end

function M.register_plugin(plugin)
	if not plugin.rules then
		return
	end
	for _, rule in ipairs(plugin.rules) do
		rule.plugin = plugin.name
		table.insert(rules, rule)
	end
end

function M.apply()
	for _, spec in ipairs(rules) do
		if spec.enabled ~= false then
			local clean = {}
			for k, v in pairs(spec) do
				if k ~= "enabled" and k ~= "plugin" then
					clean[k] = v
				end
			end
			hl.window_rule(clean)
		end
	end
end

function M.list()
	return rules
end

return M
