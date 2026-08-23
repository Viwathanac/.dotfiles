local M = {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>u", ":UndotreeToggle<cr>", { silent = true, desc = "Undo Tree" })
    end,
}
return M
