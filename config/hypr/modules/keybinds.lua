---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "ALT"
local altMod = "SUPER"

local window = require("script/window")

hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(Terminal), { desc = "Open Terminal" })
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(Browser), { desc = "Open Browser" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(FileManager), { desc = "Open File Manager" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("pidof rofi || rofi -show drun"))
hl.bind(altMod .. " + SPACE", hl.dsp.exec_cmd("pidof rofi || rofi -show window"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("pidof rofi || rofi -show run"))

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Q", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + T", hl.dsp.group.toggle())

hl.bind(mainMod .. " + H", function() window.move("left") end)
hl.bind(mainMod .. " + L", function() window.move("right") end)
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down", group_aware = true }))

hl.bind(altMod .. " + SHIFT + H", hl.dsp.group.move_window({ forward = false }))
hl.bind(altMod .. " + SHIFT + L", hl.dsp.group.move_window({ forward = true }))

for i = 1, 5 do
    local key = i
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + Z", hl.dsp.workspace.toggle_special("settings"))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Submap
hl.bind(altMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("K", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("J", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("ESCAPE", hl.dsp.submap("reset"))
end)
