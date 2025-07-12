local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
}

function M.config()
	require("harpoon").setup({
		menu = {
			width = vim.api.nvim_win_get_width(0) - 4,
		},
		settings = {
			save_on_toggle = true,
		},
	})
end

function M.init()
	local harpoon = require("harpoon")

	vim.keymap.set("n", "<leader>h", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end)

	vim.keymap.set("n", "<leader>a", function()
		harpoon:list():add()
	end, { desc = "Harpoon: Add file" })

	vim.keymap.set("n", "<leader>1", function()
		harpoon:list():select(1)
	end)
	vim.keymap.set("n", "<leader>2", function()
		harpoon:list():select(2)
	end)
	vim.keymap.set("n", "<leader>3", function()
		harpoon:list():select(3)
	end)
	vim.keymap.set("n", "<leader>4", function()
		harpoon:list():select(4)
	end)
	vim.keymap.set("n", "<leader>5", function()
		harpoon:list():select(5)
	end)
end

return M
