local M = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
}

function M.config()
    require("harpoon").setup({
        menu = {
            width = vim.api.nvim_win_get_width(0) - 4,
        },
        settings = {
            save_on_toggle = true,
        },
    })
end

function M.init()
    local harpoon = require("harpoon")

    vim.keymap.set("n", "<leader>h", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon: Menu" })

    vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
    end, { desc = "Harpoon: Add file" })

    for i = 1, 5, 1 do
        vim.keymap.set("n", "<leader>" .. i, function()
            harpoon:list():select(i)
        end, { desc = "Harpoon: Move" })
    end
end

return M
