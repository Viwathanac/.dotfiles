local M = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	cmd = "Telescope",
	lazy = false,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "jvgrootveld/telescope-zoxide" },
	},
}

function M.init()
	vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

	vim.keymap.set({ "n", "v" }, "<Leader>tc", "<cmd>Telescope commands<cr>", { desc = "Show Commands" })
	vim.keymap.set("n", "<leader>ts", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "FZF current buffer" })
	vim.keymap.set("n", "<leader>tp", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
	vim.keymap.set("n", "<leader>tg", "<cmd>Telescope git_files<cr>", { desc = "Git files" })
	vim.keymap.set("n", "<leader>to", "<cmd>Telescope oldfiles<cr>", { desc = "Old files" })
	vim.keymap.set("n", "<leader>tB", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
	vim.keymap.set("n", "<leader>tb", "<cmd>Telescope file_browser<cr>", { desc = "File Browser" })
	vim.keymap.set("n", "<leader>th", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
	vim.keymap.set("n", "<leader>tC", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme" })
	vim.keymap.set("n", "<leader>td", "<cmd>Telescope zoxide list<cr>", { desc = "Zoxide" })
	vim.keymap.set("n", "<leader>tm", "<cmd>Telescope man_pages<cr>", { desc = "Man pages" })
	vim.keymap.set("n", "<leader>tn", "<cmd>Telescope notify<cr>", { desc = "Notifications" })
end

function M.config()
	require("telescope").setup({
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	})
end
return M
