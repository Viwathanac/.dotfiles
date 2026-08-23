local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim",          cmd = "Mason" },
        { "mason-org/mason-lspconfig.nvim" },
    },
}

function M.config()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
        opts = {
            ui = {
                check_outdated_packages_on_open = true,
                border = "rounded",
                backdrop = 60,
                width = 0.8,
                height = 0.9,
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
            keymaps = {
                toggle_package_expand = "<CR>",
                install_package = "i",
                update_package = "u",
                check_package_version = "c",
                update_all_packages = "U",
                check_outdated_packages = "C",
                uninstall_package = "X",
                cancel_installation = "<C-c>",
                apply_language_filter = "<C-f>",
                toggle_package_install_log = "<CR>",
                toggle_help = "g?",
            },
        },
    })
    mason_lspconfig.setup({
        ensure_installed = {
            "lua_ls",
            "clangd",
            "bashls",
            "rust_analyzer",
            "gopls",
            "jsonls",
            "marksman",
        },
    })
end

return M
