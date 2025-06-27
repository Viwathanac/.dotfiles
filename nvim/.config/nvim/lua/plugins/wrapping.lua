local M = {
	"andrewferrier/wrapping.nvim",
	cmd = "Wrapping",
	lazy = false,
}

function M.init()
	local wrap = require("wrapping")

	vim.keymap.set("n", "<leader>wm", wrap.toggle_wrap_mode, { desc = "Toggle Wrapping Mode" })
	vim.keymap.set("n", "<leader>wh", wrap.hard_wrap_mode, { desc = "Hard Wrapping Mode" })
	vim.keymap.set("n", "<leader>ws", wrap.soft_wrap_mode, { desc = "Soft Wrapping Mode" })
end

function M.config()
	local wrapping = require("wrapping")

	wrapping.setup({
		notify_on_switch = true,
		auto_set_mode_filetype_allowlist = {
			"asciidoc",
			"gitcommit",
			"latex",
			"mail",
			"markdown",
			"rst",
			"tex",
			"text",
		},
	})
end

return M
