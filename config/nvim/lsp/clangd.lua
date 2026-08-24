return {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'h' },
    root_markers = {
        '.clangd',
        '.clang-format',
        '.git',
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities()
}
