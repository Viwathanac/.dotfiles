vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local buffer = ev.buf
		local opts = { buffer = buffer }
		local builtin = require("telescope.builtin")

		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, buffer)
		end

		if client:supports_method("textDocument/hover") then
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover({ border = "rounded", focus = false })
			end, opts)
		end

		if client:supports_method("textDocument/references") then
			vim.keymap.set("n", "gR", function()
				builtin.lsp_references()
			end, opts)
		end

		if client:supports_method("textDocument/declaration") then
			vim.keymap.set("n", "gD", function()
				vim.lsp.buf.declaration()
			end, opts)
		end

		if client:supports_method("textDocument/lsp_definition") then
			vim.keymap.set("n", "gd", function()
				builtin.lsp_definitions()
			end, opts)
		end

		if client:supports_method("textDocument/implementation") then
			vim.keymap.set("n", "gi", function()
				builtin.lsp_implementations()
			end, opts)
		end

		if client:supports_method("textDocument/format") then
			vim.keymap.set("n", "<leader>ff", function()
				require("conform").format()
			end, opts)
		end

		if client:supports_method("textDocument/type_definition") then
			vim.keymap.set("n", "gt", function()
				builtin.lsp_type_definitions()
			end, opts)
		end

		if client:supports_method("textDocument/code_action") then
			vim.keymap.set({ "n", "v" }, "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, opts)
		end

		if client:supports_method("textDocument/code_action") then
			vim.keymap.set("n", "<leader>rn", function()
				vim.lsp.buf.rename()
			end, opts)
		end

		if client:supports_method("textDocument/diagnostics") then
			vim.keymap.set("n", "<leader>d", function()
				builtin.diagnostics()
			end, opts)

			vim.keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1, float = true, silent = true })
			end, opts)

			vim.keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1, float = true, silent = true })
			end, opts)
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "c, cpp, python, rust, sh, go",
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
