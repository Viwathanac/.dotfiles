local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()
mason_lspconfig.setup ({ ensure_installed = { "lua_ls" } })

-- lua
lspconfig.lua_ls.setup {
	capabilities = caps,
	settings = {
		Lua = {
			diagonostics = { globals = { "vim" } }
		}
	},
}
