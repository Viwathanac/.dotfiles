--Auto Formatting
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end
    end
})

--Vertical Split by default
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    command = "wincmd L"
})
