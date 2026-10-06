-- One file for every machine. Monitors are matched by description prefix
-- (make + model, see `hyprctl monitors`), so the serial number doesn't matter.

-- lazarus: Samsung ultrawide, with the Acer rotated to portrait on its left.
hl.monitor({
	output = "desc:Samsung Electric Company Odyssey G85SB",
	mode = "3440x1440@174.96",
	position = "0x0",
	scale = 1,
})
hl.monitor({
	output = "desc:Acer Technologies XB271HU",
	mode = "2560x1440@165",
	position = "-1440x-450",
	scale = 1,
	transform = 1, -- 90°
})

-- Workspaces 1-10 always exist (persistent), so waybar shows them all.
-- lazarus pins 1-5 to the Samsung and 6-10 to the Acer. Only there: on other
-- hosts, rules naming lazarus' monitors would make every monitor skip 1-10
-- when picking its first workspace (the laptop would start on 11).
local f = io.open("/etc/hostname")
local host = f and f:read("l")
if f then
	f:close()
end

for i = 1, 10 do
	local rule = { workspace = tostring(i), persistent = false }
	if host == "lazarus" then
		rule.monitor = i <= 5 and "desc:Samsung Electric Company Odyssey G85SB" or "desc:Acer Technologies XB271HU"
		rule.default = i == 1 or i == 6
	end
	hl.workspace_rule(rule)
end

-- halflight, with the screens it gets plugged into.
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "0x0",
	scale = 1,
})
hl.monitor({
	output = "desc:Lenovo Group Limited P27q-20",
	mode = "preferred",
	position = "1920x0",
	scale = 1,
})
hl.monitor({
	output = "desc:Synaptics Inc Non-PnP 0x00BC614E",
	mode = "3440x1440",
	position = "4480x0",
	scale = 1,
})
hl.monitor({
	output = "desc:Dell Inc. DELL",
	mode = "3440x1440",
	position = "auto",
	scale = 1,
})

-- Meeting-room TV and projector show a copy of the laptop screen.
hl.monitor({
	output = "desc:Samsung Electric Company SAMSUNG 0x01000E00",
	mode = "preferred",
	position = "auto",
	scale = 1,
	mirror = "eDP-1",
})
hl.monitor({
	output = "desc:Lightware Visual Engineering",
	mode = "preferred",
	position = "auto",
	scale = 1,
	mirror = "eDP-1",
})

-- Anything else (projectors, borrowed screens) extends the desktop. To mirror
-- the laptop screen instead, add `mirror = "eDP-1"` here.
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})
