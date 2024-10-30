local lspconfig = require "lspconfig"
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["lua_ls"].setup({
	settings = {
		Lua = {
			format = { enable = false },
			diagnostics = { globals = { "vim" } },
			runtime = {
				pathStrict = true,
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			workspace = {
				libray = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

--Javascript
lspconfig["ts_ls"].setup({
	capabilities = capabilities,
})

-- Python
lspconfig["ast-grep"].setup({
	capabilities = capabilities,
})
