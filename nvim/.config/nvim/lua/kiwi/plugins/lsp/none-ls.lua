local M = {
	{ "nvimtools/none-ls.nvim" },
}

function M.config()
	local null_ls = require("null_ls")

	local format = null_ls.builtins.formatting
	local diag = null_ls.builtins.diagnostics
	local actions = null_ls.builtins.actions

	--Use Mason to install:	blackm prettier, stylua, isort, clang_format, shellcheck
	null_ls.setup({
		debug = true,
		sources = {
			format.black.with {
				extra_args = function ()
					return {
						"--fast",
						"--quiet",
					}
				end,
			},
			format.prettier.with {
				extra_args = function(_)
					return vim.bo[0].ft == "css" and { "--parser", "css" }
				end,
			},
			format.stylua,
			format.isort,
			format.ast_grep,

			diag.shellcheck,
			diag.eslint_d,
            diag.clang_format,
            diag.ast_grep,

			actions.shellcheck,
            actions.ast_grep,
		},
	})
end

return M
