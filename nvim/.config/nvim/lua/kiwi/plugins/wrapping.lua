local M = {
    "andrewferrier/wrapping.nvim",
    cmd = "Wrapping",
    lazy = false,
}

function M.config()
    local wrapping = require("wrapping")

    wrapping.setup({
        notify_on_switch = true,
        auto_set_mode_filetype_allowlist = {
            "asciidoc",
            "gitcommit",
            "latex",
            "mail",
            "markdown",
            "rst",
            "tex",
            "text",
        },
    })
end

return M
