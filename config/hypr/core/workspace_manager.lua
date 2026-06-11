local groups = {}

local M = {}

function M.register(group, plugin_name)
	group.plugin = plugin_name
	table.insert(groups, group)
end

function M.register_plugin(plugin)
	if not plugin.workspaces then
		return
	end
	for _, group in ipairs(plugin.workspaces) do
		group.plugin = plugin.name
		table.insert(groups, group)
	end
end

function M.apply()
	for _, group in ipairs(groups) do
		if group.enabled ~= false then
			for _, ws in ipairs(group.workspaces) do
				hl.workspace_rule({
					workspace = tostring(ws),
					monitor = group.monitor,
					persistent = true,
				})
			end
		end
	end
end

function M.list()
	return groups
end

return M
