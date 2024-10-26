local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate"
}

function M.config()
	local treesitter = require "nvim-treesitter.configs"
	treesitter.setup{
		ensure_installed = "all", 
		highlight = {enable = true}, 
		indent = {enable = true}, 
	}
end

return M
