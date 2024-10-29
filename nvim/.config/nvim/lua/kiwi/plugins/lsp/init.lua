local M = {
	{ "neovim/nvim-lspconfig",},
	{ "williamboman/mason.nvim", },
	{ "williamboman/mason-lspconfig.nvim", },
	cmd = "Mason",
}

function M.config()
	require "kiwi.plugins.lsp.servers"
	require "kiwi.plugins.lsp.mappings"

end

return M
