local c = require("theme")

hl.config({
    general = {
        layout = "scrolling",

        -- 8px between windows and to the screen edges, plus 16px extra at the
        -- sides so the neighbouring column peeks in (niri struts).
        gaps_in     = 4,
        gaps_out    = { top = 8, right = 24, bottom = 8, left = 24 },
        border_size = 4,

        col = {
            active_border   = "rgb(" .. c.blue .. ")",
            inactive_border = "rgb(" .. c.terminal_black .. ")",
        },
    },

    scrolling = {
        column_width             = 0.5,
        explicit_column_widths   = "0.333, 0.5, 0.667",
        fullscreen_on_one_column = false,
        focus_fit_method         = 0, -- centre the focused column
        wrap_focus               = false,
        wrap_swapcol             = false,
    },

    decoration = {
        rounding = 8,

        shadow = {
            enabled = true,
            range   = 20,
            color   = "rgba(00000070)",
        },

        blur = {
            enabled = false,
        },
    },

    misc = {
        disable_hyprland_logo   = true,
        force_default_wallpaper = 0,
        middle_click_paste      = false,
    },
})
