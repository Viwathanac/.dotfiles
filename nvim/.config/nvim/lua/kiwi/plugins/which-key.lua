local M = {
	"folke/which-key.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", version = false },
	},
	event = "VeryLazy",
}


function M.config()
	local wk = require("which-key")

	local custom_setup= {
		triggers = {
			{ "auto", mode = "nixsotc" },
			{ "a", mode = { "n", "v" } },
		},
		defer = function(ctx)
			return ctx.mode == "gc" or ctx.mode == "Comments"
		end,
		delay = 1000,
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true, -- z=, for spellings
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		win = {
			no_overlap = true,
			border = "true",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 1, 1, 1, 1 },
			wo = {
				winblend = 0,
			},
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "left",
		},
		keys = {
			scroll_down = "<c-d>",
			scroll_up = "<c-u>",
		},
		sort = { "local", "order", "group", "alphanum", "mod" },
		expand = 0,
		replace = {
			key = {
				function(key)
					return require("which-key.view").format(key)
				end,
				{ "<Space>", "SPC" },
			},
			desc = {
				{ "<Plug>%(?(.*)%)?", "%1" },
				{ "^%+", "" },
				{ "<[cC]md>", "" },
				{ "<[cC][rR]>", "" },
				{ "<[sS]ilent>", "" },
				{ "^lua%s+", "" },
				{ "^call%s+", "" },
				{ "^:%s*", "" },
			},
		},
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
			ellipsis = "…",
			mappings = true,
			colors = true,
			keys = {
				Up = " ",
				Down = " ",
				Left = " ",
				Right = " ",
				C = "󰘴 ",
				M = "󰘵 ",
				D = "󰘳 ",
				S = "󰘶 ",
				CR = "󰌑 ",
				Esc = "󱊷 ",
				ScrollWheelDown = "󱕐 ",
				ScrollWheelUp = "󱕑 ",
				NL = "󰌑 ",
				BS = "󰁮",
				Space = "󱁐 ",
				Tab = "󰌒 ",
				F1 = "󱊫",
				F2 = "󱊬",
				F3 = "󱊭",
				F4 = "󱊮",
				F5 = "󱊯",
				F6 = "󱊰",
				F7 = "󱊱",
				F8 = "󱊲",
				F9 = "󱊳",
				F10 = "󱊴",
				F11 = "󱊵",
				F12 = "󱊶",
			},
		},
		show_help = true,
		show_keys = true,
		debug = false,
	}

	wk.setup({custom_setup})

	wk.add({
		{ "<leader>g", group = "General" },
		{ "<leader>h", group = "Harpoon" },
		{ "<leader>t", group = "Telescope" },
		{ "<leader>w", group = "Wrapping" },
	})
end

return M

