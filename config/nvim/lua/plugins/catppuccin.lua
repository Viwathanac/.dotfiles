local M = {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
}

function M.config()
    require("catppuccin").setup({
        flavour = "mocha",
        background = {
            light = "latte",
            dark = "mocha",
        },
        float = {
            transparent = true,
            solid = false,
        },
        auto_integrations = true,
        transparent_background = false,
        term_colors = true,
        custom_highlights = function(colors)
            return {
                CursorLineNr = { fg = colors.rosewater },
                LineNr = { fg = colors.overlay0 },
                WinSeparator = { fg = colors.text }
            }
        end
    })

    vim.cmd.colorscheme("catppuccin-nvim")
end

return M
