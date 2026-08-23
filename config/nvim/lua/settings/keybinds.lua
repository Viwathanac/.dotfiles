vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<CR>", ":noh<CR><CR>", {})
vim.keymap.set("n", "Q", "<Nop>", { desc = "Remove annoying exmode" })
vim.keymap.set("n", "q:", "<Nop>", { desc = "Remove annoying exmode" })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>y", [["+y]], { desc = "Yank to system clipboard" })

vim.keymap.set("i", ",", ",<C-g>u")
vim.keymap.set("i", ".", ".<C-g>u")
vim.keymap.set("i", "!", "!<C-g>u")
vim.keymap.set("i", "?", "?<C-g>u")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<", "<gv", { desc = "Dedent current selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent current selection" })

--LSP Keybinds
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local buffer = ev.buf
        local builtin = require("telescope.builtin")

        if client:supports_method("textDocument/hover") then
            vim.keymap.set("n", "K", function()
                vim.lsp.buf.hover({ focus = false })
            end)
        end
        if client:supports_method("textDocument/references") then
            vim.keymap.set("n", "gR", function()
                builtin.lsp_references()
            end)
        end
        if client:supports_method("textDocument/declaration") then
            vim.keymap.set("n", "gD", function()
                vim.lsp.buf.declaration()
            end)
        end
        if client:supports_method("textDocument/lsp_definition") then
            vim.keymap.set("n", "gd", function()
                builtin.lsp_definitions()
            end)
        end
        if client:supports_method("textDocument/implementation") then
            vim.keymap.set("n", "gi", function()
                builtin.lsp_implementations()
            end)
        end
        if client:supports_method("textDocument/type_definition") then
            vim.keymap.set("n", "gt", function()
                builtin.lsp_type_definitions()
            end)
        end
        if client:supports_method("textDocument/code_action") then
            vim.keymap.set({ "n", "v" }, "<leader>ca", function()
                vim.lsp.buf.code_action()
            end)
        end
        if client:supports_method("textDocument/code_action") then
            vim.keymap.set("n", "<leader>rn", function()
                vim.lsp.buf.rename()
            end)
        end

        vim.keymap.set("n", "<leader>d", function()
            vim.diagnostic.open_float()
        end)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = false, silent = true })
        end)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = false, silent = true })
        end)
    end,
})
