local M = {}

function M.load_programs(tbl)
	for k, v in pairs(tbl) do
		_G[k] = v
	end
end

function M.load_env(tbl)
	for _, entry in ipairs(tbl) do
		hl.env(entry.var, entry.value)
	end
end

function M.load_monitors(tbl)
	for _, m in ipairs(tbl) do
		hl.monitor(m)
	end
end

function M.load_settings(tbl)
	for section, opts in pairs(tbl) do
		hl.config({ [section] = opts })
	end
end

function M.load_animations(tbl)
	if tbl.curves then
		for _, c in ipairs(tbl.curves) do
			local name = c.name
			c.name = nil
			hl.curve(name, c)
		end
	end
	if tbl.animations then
		for _, a in ipairs(tbl.animations) do
			hl.animation(a)
		end
	end
end

function M.load_layouts(tbl)
	for layout, opts in pairs(tbl) do
		hl.config({ [layout] = opts })
	end
end

function M.load_input(tbl)
	if tbl.input then
		hl.config({ input = tbl.input })
	end
	if tbl.gestures then
		for _, g in ipairs(tbl.gestures) do
			hl.gesture(g)
		end
	end
	if tbl.devices then
		for _, d in ipairs(tbl.devices) do
			hl.device(d)
		end
	end
end

function M.load_autostart(tbl)
	hl.on("hyprland.start", function()
		for _, entry in ipairs(tbl) do
			hl.exec_cmd(entry.exec_cmd)
		end
	end)
end

return M
