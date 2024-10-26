local M = {
    "nvim-neo-tree/neo-tree.nvim", branch = "v3.x",
	cmd = "Neotree",
    dependencies = {
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    }
}

function M.init() 
	vim.keymap.set("n", "<leader>n", "<cmd>Neotree toggle<cr>", {})
end

function M.config()
	vim.g.neo_tree_remove_legacy_commands = 1,

	require("neo-tree").setup {
		filesystem = {
			highjack_netrw_behavior = "open_current", 
		},
	}
end
return M
