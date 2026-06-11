local CONFIG_DIR = os.getenv("HOME") .. "/.config/hypr"

local RuleManager = require("core.rule_manager")
local BindManager = require("core.bind_manager")
local WorkspaceManager = require("core.workspace_manager")

local registered = {}

local M = {}

function M.register(name)
	registered[name] = true
end

local function discover_plugins()
	local handle = io.popen("ls " .. CONFIG_DIR .. "/plugins/*.lua 2>/dev/null")
	if not handle then
		return {}
	end
	local result = handle:read("*a")
	handle:close()
	local names = {}
	for file in result:gmatch("([^/\n]+)%.lua") do
		if file ~= "init" then
			names[#names + 1] = file
		end
	end
	return names
end

function M.setup(spec)
	if type(spec) == "table" then
		if spec.import then
			local names = discover_plugins()
			for _, name in ipairs(names) do
				registered[name] = true
			end
		else
			for _, name in ipairs(spec) do
				registered[name] = true
			end
		end
	end

	for name, _ in pairs(registered) do
		local ok, plugin = pcall(require, "plugins." .. name)
		if not ok or not plugin then
			io.stderr:write("[hypr] plugin '" .. name .. "' not found\n")
			goto continue
		end

		if plugin.enabled == false then
			goto continue
		end

		if plugin.dependencies then
			for _, dep in ipairs(plugin.dependencies) do
				local f = io.popen("command -v " .. dep .. " 2>/dev/null")
				if f then
					local has = f:read("*a")
					f:close()
					if has == "" then
						io.stderr:write("[hypr] missing dependency '" .. dep .. "' for '" .. name .. "'\n")
					end
				end
			end
		end

		if plugin.startup then
			local cmds = type(plugin.startup) == "table" and plugin.startup or { plugin.startup }
			hl.on("hyprland.start", function()
				for _, cmd in ipairs(cmds) do
					hl.exec_cmd(cmd)
				end
			end)
		end

		WorkspaceManager.register_plugin(plugin)
		RuleManager.register_plugin(plugin)
		BindManager.register_plugin(plugin)

		::continue::
	end

	WorkspaceManager.apply()
	RuleManager.apply()
end

function M.list()
	local names = {}
	for name, _ in pairs(registered) do
		names[#names + 1] = name
	end
	table.sort(names)
	return names
end

return M
