local M = {
	"stevearc/conform.nvim",
	opts = {},
}

function M.config()
	local conform = require("conform")
	conform.setup({
		format_on_save = { timeout_ms = 500 },
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			python = { "isort", "black" },
			--rust = { "rustfmt" },
			sh = { "shfmt" },
		},
	})
end

return M
