-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd(Terminal)
    hl.exec_cmd(Sound)
    hl.exec_cmd(Bluetooth)
    hl.exec_cmd(Notification)
    hl.exec_cmd("qs")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("hyprpaper & hypridle & hyprsunset")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    require("script/display").setup(Monitor)
end)
