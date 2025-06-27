return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	opts = {
		menu = {
			width = vim.api.nvim_win_get_width(0) - 4,
		},
		settings = {
			save_on_toggle = true,
		},
	},
	keys = function()
		local keys = {
			{
				"<leader>a",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Harpoon File",
			},
			{
				"<leader>h",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon Quick Menu",
			},
			{
				"<leader>6",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Harpoon Select 1",
			},
			{
				"<leader>7",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Harpoon Select 2",
			},
			{
				"<leader>8",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Harpoon Select 3",
			},
			{
				"<leader>9",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Harpoon Select 4",
			},
			{
				"<leader>0",
				function()
					require("harpoon"):list():select(5)
				end,
				desc = "Harpoon Select 5",
			},
		}
		return keys
	end,
}
