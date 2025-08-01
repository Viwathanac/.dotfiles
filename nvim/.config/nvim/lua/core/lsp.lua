vim.lsp.enable({
	"lua_ls",
	"bashls",
	"rust_analyzer",
	"clangd",
})

vim.diagnostic.config({
	virtual_text = true,
	--virtual_lines = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		header = "false",
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})
