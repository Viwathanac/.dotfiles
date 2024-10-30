local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim", },
		{ "williamboman/mason-lspconfig.nvim", },
		{ "hrsh7th/nvim-cmp" },
		{ "antosha417/nvim-lsp-file-operations", config = true }
	},
}

function M.config()
	require("mason").setup()

	local mason_lspconfig = require("mason-lspconfig")
	mason_lspconfig.setup({
		ensure_installed = {
			"lua_ls",
			"ts_ls",
			"html",
			"cssls",
			"tailwindcss",
			"prismals",
		},
		automatic_installation = true,
	})

	require "kiwi.plugins.lsp.servers"
	require "kiwi.plugins.lsp.mappings"
end

return M
