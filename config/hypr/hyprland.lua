-------------------------
---- GLOBAL VARIABLE ----
-------------------------

Monitor = "HDMI-A-1"
Laptop = "eDP-1"

Terminal = "alacritty"
Browser = "firefox"
Sound = "pavucontrol"
Bluetooth = "blueman-manager"
FileManager = "dolphin"
Notification = "mako"
Launcher = "rofi"

-----------------
---- MODULES ----
-----------------
require("themes/catppuccin-mocha")

require("modules/autostart")
require("modules/decorations")
require("modules/devices")
require("modules/env")
require("modules/keybinds")
--require("modules/permissions")
require("modules/rules")

--require("script/display").config_monitor(Monitor)
require("script/display").setup(Monitor)
