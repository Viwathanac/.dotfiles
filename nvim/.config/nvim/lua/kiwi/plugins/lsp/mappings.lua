local mappings = {}

function mappings.setup(client_name, buffer)

    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buffer, desc = "Code action" })
    vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { buffer = buffer, desc = "Code action (range)" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buffer, desc = "Go to declaration" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buffer, desc = "Go to definition" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = buffer, desc = "Go to inplementation" })
    vim.keymap.set("n", "gr", vim.lsp.buf.rename, { buffer = buffer, desc = "Rename" })
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = buffer, desc = "Type definition" })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buffer, desc = "Hover" })


	if mappings[client_name] then
		mappings[client_name]()
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buffer = args.buf
        local client_name = vim.lsp.get_client_by_id(args.data.client_id)["name"]
        mappings.setup(client_name, buffer)
    end,
})
