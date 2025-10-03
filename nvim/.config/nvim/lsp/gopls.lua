local M = {
	cmd = { "gopls" },
	filetypes = { "go", "gomod" },
	root_dir = function(startpath)
		return M.search_ancestors(startpath, matcher)
	end,
}

function M.config()
	require("lspconfig").gopls.setup({})
end

return M
