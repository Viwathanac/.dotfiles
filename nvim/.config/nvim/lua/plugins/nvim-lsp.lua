local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "mason-org/mason.nvim", cmd = "Mason" },
		{ "mason-org/mason-lspconfig.nvim" },
		{ "nvimtools/none-ls.nvim" },
		{ "hrsh7th/nvim-cmp" },
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
}

function M.config()
	local mason = require("mason")
	local lspconfig = require("mason-lspconfig")
	local file_operation = require("lsp-file-operations")

	mason.setup({
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	})

	lspconfig.setup({
		ensure_installed = {
			"lua_ls",
			"clangd",
			"bashls",
			"rust_analyzer",
		},
		automatic_installation = true,
	})

	file_operation.setup({
		debug = false,
		operations = {
			willRenameFiles = true,
			didRenameFiles = true,
			willCreateFiles = true,
			didCreateFiles = true,
			willDeleteFiles = true,
			didDeleteFiles = true,
		},
		timeout_ms = 10000,
	})
end

return M
