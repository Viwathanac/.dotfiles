local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
}

function M.config()
	local treesitter = require "nvim-treesitter.configs"
	treesitter.setup({
		ensure_installed = "all",
		highlight = {enable = true},
		indent = {enable = true},
	})

	for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
	  vim.api.nvim_set_hl(0, group, {})
	end
end

return M
