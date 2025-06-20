local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "nvimtools/none-ls.nvim" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/nvim-cmp" },
		{ "antosha417/nvim-lsp-file-operations", config = true }
	},
}

function M.config()
	require "kiwi.plugins.lsp.lsp-config"
	require "kiwi.plugins.lsp.servers"
	require "kiwi.plugins.lsp.remap"
end

return M
