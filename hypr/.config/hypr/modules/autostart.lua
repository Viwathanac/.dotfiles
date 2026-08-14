-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd(Terminal)
    hl.exec_cmd(Sound)
    hl.exec_cmd(Bluetooth)
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("waybar & hyprpaper & hypridle & hyprsunset")
    hl.exec_cmd("swaync")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    require("script/display").setup(Monitor)
end)
