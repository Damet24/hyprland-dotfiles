local binds = {}

local DEFAULT_MOD = "SUPER"

local function normalize(spec, plugin_name)
	local mods = spec.mods
	if not mods or #mods == 0 then
		if spec.mod == nil then
			mods = { DEFAULT_MOD }
		elseif spec.mod ~= "" then
			mods = { spec.mod }
		else
			mods = {}
		end
	end
	local combo
	if #mods > 0 then
		combo = table.concat(mods, " + ") .. " + " .. spec.key
	else
		combo = spec.key
	end
	return {
		combo    = combo,
		action   = spec.action,
		opts     = spec.opts or {},
		desc     = spec.desc or "",
		category = spec.category,
		enabled  = spec.enabled,
		plugin   = plugin_name or "",
	}
end

local M = {}

function M.register(spec, plugin_name)
	table.insert(binds, normalize(spec, plugin_name))
end

function M.register_plugin(plugin)
	if not plugin.keys then
		return
	end
	for _, key in ipairs(plugin.keys) do
		table.insert(binds, normalize(key, plugin.name))
	end
end

function M.apply()
	for _, spec in ipairs(binds) do
		if spec.enabled ~= false then
			hl.bind(spec.combo, spec.action, spec.opts)
		end
	end
end

function M.list()
	return binds
end

function M.export()
	local groups = {}
	for _, spec in ipairs(binds) do
		if spec.enabled ~= false then
			local g = spec.category or spec.plugin or "General"
			if g == "" then
				g = "General"
			end
			groups[g] = groups[g] or {}
			table.insert(groups[g], {
				combo = spec.combo,
				desc  = spec.desc,
			})
		end
	end
	return groups
end

return M
