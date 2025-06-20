require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
        "clangd",
        "rust_analyzer",
		"html",
		"cssls",
		"tailwindcss",
		"prismals",
	},
	automatic_installation = true,
})

local lsp_file_operations = require("lsp-file-operations")
lsp_file_operations.setup {
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
}

