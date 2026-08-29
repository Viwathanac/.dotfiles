local M = {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    lazy = false,
}

function M.init()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>")
end

local detail = false
function M.config()
    require("oil").setup({
        default_file_explorer = true,
        columns = {
            { "icon" },
        },
        buf_options = {
            buflisted = false,
            bufhidden = "hide",
        },
        win_options = {
            wrap = false,
            signcolumn = "no",
            cursorcolumn = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "nvic",
        },
        delete_to_trash = false,
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        lsp_file_methods = {
            enabled = true,
            timeout_ms = 1000,
            autosave_changes = "unmodified",
        },
        constrain_cursor = "editable",
        watch_for_changes = false,
        view_options = {
            show_hidden = true
        },
        keymaps = {
            ["g?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            ["gd"] = {
                desc = "Toggle file detail view",
                callback = function()
                    detail = not detail
                    if detail then
                        require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                    else
                        require("oil").set_columns({ "icon" })
                    end
                end,
            },
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = { "actions.close", mode = "n" },
            ["<C-l>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            ["gs"] = { "actions.change_sort", mode = "n" },
            ["g."] = { "actions.toggle_hidden", mode = "n" },
        },
        use_default_keymaps = false,
        float = {
            preview_split = "right",
        },
    })
end

return M
