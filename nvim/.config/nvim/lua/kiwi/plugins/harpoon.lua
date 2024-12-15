local M = {
	"ThePrimeagen/harpoon",
	lazy = false,
	config = function()
		local opts = { noremap = true, silent = true }
		for i = 1, 9 do
			vim.keymap.set("n", "<leader>" .. i, function()
				require("harpoon.ui").nav_file(i)
			end, { desc = "Harpoon " .. i .. " file" })
		end
		opts.desc = "Harpoon: Marked Files"
		vim.keymap.set("n", "<leader>ha", function()
			require("harpoon.mark").add_file()
			require("notify")("Harpoon: Marked File")
		end, opts)

		opts.desc = "Harpoon: Toggle UI"
		vim.keymap.set("n", "<leader><Tab>", function()
			require("harpoon.ui").toggle_quick_menu()
		end, opts)
	end,
}

return M
