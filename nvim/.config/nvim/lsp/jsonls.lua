local M = {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json" },
	init_options = {
		provideFormatter = true,
	},
}

function M.config()
	require("lspconfig").jsonls.setup({
		commands = {
			Format = {
				function()
					vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
				end,
			},
		},
	})
end

return M
