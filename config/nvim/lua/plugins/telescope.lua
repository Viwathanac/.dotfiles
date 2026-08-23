local M = {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        "nvim-tree/nvim-web-devicons",
        "jvgrootveld/telescope-zoxide",
    },
}

function M.init()
    local builtin = require("telescope/builtin")

    vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>tp", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>tB", builtin.buffers, { desc = "Find files" })
    vim.keymap.set("n", "<leader>tg", builtin.git_files, { desc = "Git files" })
    vim.keymap.set("n", "<leader>to", builtin.oldfiles, { desc = "Old files" })
end

function M.config()
    require("telescope").setup({
        defaults = {
            preview = {
                treesitter = false,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    })
end

return M
