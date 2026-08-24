return {
    cmd = { 'bash-language-server', 'start' },
    settings = {
        bashIde = {
            globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
        },
    },
    filetypes = { 'bash', 'sh' },
    root_markers = { '.git' },
    capabilities = require('cmp_nvim_lsp').default_capabilities()
}
