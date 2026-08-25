return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    settings = {
        ['rust-analyzer'] = {
            lens = {
                enabled = true,
                implementation = { enabled = true },
                debug = { enabled = true }
            },
            hideDeprecated = true,
            diagnostics = {
                enabled = true,
            }
        }
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities()
}
