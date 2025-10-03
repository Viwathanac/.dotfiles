local M = {
	cmd = { "sqls" },
	filetype = { "sql", "mysql" },
}

function M.config()
	require("lspconfig").sqls.setup({})
end

return M
