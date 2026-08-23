-----------------------
---- LOOK AND FEEL ----
-----------------------

local colors = require("themes/catppuccin-mocha")
hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 2,
        border_size = 2,
        col = {
            active_border = { colors = { colors.text } },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 2,
        rounding_power = 4,
        active_opacity = 0.98,
        inactive_opacity = 1.0,
        dim_special = 0.4,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = true,
        },
    },
    animations = {
        enabled = false,
    },
    group = {
        col = {
            border_active = { colors = { colors.text } },
            border_inactive = { colors = { colors.crust } },
        },
        groupbar = {
            enabled = true,
            height = 20,
            text_color = colors.text,
            font_size = 12,
            col = {
                active = { colors = { colors.rosewater } },
                inactive = { colors = { colors.surface1 } },
            },
        },
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------
hl.config({
    misc = {
        font_family = "JetBrainsMono Nerd Font",
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        mouse_move_enables_dpms = false,
        key_press_enables_dpms = false,
    },
    cursor = {
        no_hardware_cursors = true,
    },
})
