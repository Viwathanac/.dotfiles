local M = {
	cmd = { "bash-language-server", "start" },
	filetype = { "bash", "sh" },
	root_marker = { ".git" },
}

function M.config()
	require("lspconfig").bashls.setup({
		cmd = { "bash-language-server", "start" },
		cmd_env = {
			GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
		},
		filetypes = { "sh" },
		capabilities = bashls_capabilities,
		root_dir = function(path)
			if not path or #path == 0 then
				return
			end
			local result = path:gsub(strip_sep_pat, ""):gsub(strip_dir_pat, "")
			if #result == 0 then
				return "/"
			end
			return result
		end,
	})
end

return M
