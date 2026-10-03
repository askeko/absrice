-- Start on the main monitor (lazarus' Samsung) when it's connected.
hl.on("hyprland.start", function()
    -- mako can outlive a session; don't let it start a new one hidden.
    hl.exec_cmd("makoctl mode -r screenshare")
    for _, mon in ipairs(hl.get_monitors()) do
        if mon.description:find("Samsung Electric Company Odyssey G85SB", 1, true) == 1 then
            hl.dispatch(hl.dsp.focus({ monitor = mon }))
        end
    end
end)

-- Hide notifications while the screen is shared (mako's "screenshare" mode;
-- the manual toggle uses the separate "privacy" mode). Counted, so one share
-- ending doesn't unhide during another.
-- A reload resets the count while a share may still be running, so a stop at
-- zero still unhides: mako can't get stuck hidden. The cost: with two shares
-- running across a reload, the first one to stop unhides.
local shares = 0
hl.on("screenshare.state", function(active)
    if active then
        shares = shares + 1
        if shares == 1 then
            hl.exec_cmd("makoctl mode -a screenshare")
        end
    else
        shares = math.max(shares - 1, 0)
        if shares == 0 then
            hl.exec_cmd("makoctl mode -r screenshare")
        end
    end
end)
