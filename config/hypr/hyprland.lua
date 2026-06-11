-- Hyprland main configuration
-- Each concern is split into its own module for clarity

require("monitors")
require("programs")
require("env")
require("autostart")
require("settings")
require("animations")
require("layouts")
require("input")
require("window_rules")
require("keybinds")

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })
-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
