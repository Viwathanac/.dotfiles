local M = {
	{
		{"ThePrimeagen/vim-be-good", cmd = "VimBeGood"},
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin"
				}
			})

		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function ()
			local ibl = require("ibl")
			ibl.setup({})
		end
	},
	{
		"mbbill/undotree",
		config = function ()
			vim.keymap.set("n", "<leader>u", ":UndotreeToggle<cr>", {desc = "Undo Tree"})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {}
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function ()
			require("colorizer").setup()
		end,
	},
}

return M
