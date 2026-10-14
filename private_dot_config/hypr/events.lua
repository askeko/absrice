-- Start on the main monitor (lazarus' Samsung) when it's connected.
hl.on("hyprland.start", function()
    for _, mon in ipairs(hl.get_monitors()) do
        if mon.description:find("Samsung Electric Company Odyssey G85SB", 1, true) == 1 then
            hl.dispatch(hl.dsp.focus({ monitor = mon }))
        end
    end
end)

-- Hide notifications while the screen is shared (Noctalia's do-not-disturb).
-- Counted, so one share ending doesn't unhide during another; do-not-disturb
-- that was already on before the share stays on afterwards.
-- A reload resets the count while a share may still be running, so a stop at
-- zero still unhides: it can't get stuck on. The cost: with two shares
-- running across a reload, the first one to stop unhides.
local shares = 0
local dnd_before = false
hl.on("screenshare.state", function(active)
    if active then
        shares = shares + 1
        if shares == 1 then
            local p = io.popen("noctalia msg notification-dnd-status 2>/dev/null")
            dnd_before = p ~= nil and (p:read("l") or "") == "on"
            if p then
                p:close()
            end
            hl.exec_cmd("noctalia msg notification-dnd-set on")
        end
    else
        shares = math.max(shares - 1, 0)
        if shares == 0 and not dnd_before then
            hl.exec_cmd("noctalia msg notification-dnd-set off")
        end
    end
end)
