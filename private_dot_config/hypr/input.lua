hl.config({
    input = {
        -- Default for every keyboard; the laptop keyboard overrides it below.
        kb_layout = "eu",

        follow_mouse  = 1,
        accel_profile = "flat",
        sensitivity   = 0.2,

        touchpad = {
            natural_scroll = true,
            tap_to_click   = true,
        },
    },

    cursor = {
        inactive_timeout = 2, -- seconds
    },
})

-- halflight's built-in keyboard. resolve_binds_by_sym makes binds follow the
-- printed keys of this layout rather than the default one.
hl.device({
    name                 = "at-translated-set-2-keyboard",
    kb_layout            = "dk",
    kb_options           = "caps:swapescape",
    resolve_binds_by_sym = true,
})
