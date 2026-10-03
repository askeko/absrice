-- Hyprland config (Lua, Hyprland 0.56+). Started by uwsm, which sets the
-- session environment (~/.config/uwsm/env); services run as systemd user units
-- under graphical-session.target, not from here.
--
-- Modules live next to this file and are loaded with require().
-- API reference: /usr/share/hypr/stubs/hl.meta.lua

require("monitors")
require("input")
require("look")
require("binds")
require("rules")
require("events")
