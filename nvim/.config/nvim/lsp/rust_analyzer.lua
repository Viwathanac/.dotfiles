local M = {
	cmd = { "rust_analyzer" },
	filetypes = { "rust" },
}

function M.config()
	require("lspconfig").rust_analyzer.setup({})
end

return M
