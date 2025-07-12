vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then
			return
		end
		local buffer = ev.buf
		local opts = { buffer = buffer }
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "gR", function()
			builtin.lsp_references()
		end, opts)

		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.declaration()
		end, opts)

		vim.keymap.set("n", "gd", function()
			builtin.lsp_definitions()
		end, opts)

		vim.keymap.set("n", "gi", function()
			builtin.lsp_implementations()
		end, opts)

		vim.keymap.set("n", "gt", function()
			builtin.lsp_type_definitions()
		end, opts)

		vim.keymap.set({ "n", "v" }, "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, opts)

		vim.keymap.set("n", "<leader>rn", function()
			vim.lsp.buf.rename()
		end, opts)

		vim.keymap.set("n", "<leader>D", function()
			builtin.diagnostics()
		end, opts)

		vim.keymap.set("n", "<leader>d", function()
			vim.diagnostic.open_float()
		end, opts)

		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, opts)

		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true, silent = true })
		end, opts)

		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true, silent = true })
		end, opts)

		vim.keymap.set("n", "<leader>ff", function()
			require("conform").format()
		end, opts)
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "c, cpp, python, rust, sh",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft` for the current filetype
		require("lint").try_lint()
	end,
})
