local M = {}

local function detect()
	for _, cmd in ipairs({ "rofi", "fuzzel", "walker", "tofi" }) do
		local f = io.popen("command -v " .. cmd .. " 2>/dev/null")
		if f then
			local path = f:read("*a")
			f:close()
			if path ~= "" then
				return cmd
			end
		end
	end
	return nil
end

function M.show_menu(opts)
	local backend = opts.backend or detect()
	local title = opts.title or "Menu"
	local items = opts.items or {}

	-- Write items to tmp file (avoids shell arg limits and blocking pipes)
	local tmp = os.tmpname()
	local f = io.open(tmp, "w")
	if f then
		f:write(table.concat(items, "\n"))
		f:close()
	end

	if backend == "rofi" then
		hl.exec_cmd("rofi -dmenu -p '" .. title .. "' -i < '" .. tmp .. "' &")
	elseif backend == "fuzzel" then
		hl.exec_cmd("fuzzel --dmenu -p '" .. title .. "' < '" .. tmp .. "' &")
	end
end

return M
