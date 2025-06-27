local M = {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
}

function M.config()
	local lint = require("lint")

	lint.linters_by_ft = {
		c = { "cpplint" },
		cpp = { "cpplint" },
		--rust = { "trivy" },
		python = { "pylint" },
		sh = { "shellcheck" },
	}
end
return M
