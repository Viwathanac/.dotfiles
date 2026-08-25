return {
    cmd = { 'qmlls', '-E' },
    filetypes = { 'qml', 'qmljs' },
    root_markers = { '.git', '.ini' },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
