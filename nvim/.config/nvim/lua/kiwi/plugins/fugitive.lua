local M = {
	"tpope/vim-fugitive",
}

function M.init()
	vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", {})
end

return M
