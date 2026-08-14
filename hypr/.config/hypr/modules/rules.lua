--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.workspace_rule({ workspace = "3", default_name = "coding" })
local terminal_format = hl.window_rule({
	name = "terminal_format",
	match = {
		class = "Alacritty",
	},
	workspace = 3,
})

-- Settings Workspace Rules
local volume_control_format = hl.window_rule({
	name = "volume_control_format",
	match = {
		title = "Volume Control",
	},
	workspace = "special:settings",
	tile = true,
})

local bluetooth_format = hl.window_rule({
	--Blueman
	name = "bluetooth_format",
	match = {
		title = "Bluetooth Devices",
	},
	workspace = "special:settings",
	tile = true,
})

suppressMaximizeRule:set_enabled(true)
volume_control_format:set_enabled(true)
terminal_format:set_enabled(true)
bluetooth_format:set_enabled(true)
