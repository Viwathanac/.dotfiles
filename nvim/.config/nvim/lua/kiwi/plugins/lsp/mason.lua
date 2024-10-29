local M = {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
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
end
return M
