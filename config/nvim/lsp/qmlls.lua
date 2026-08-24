return {
    cmd = { 'qmlls' },
    filetypes = { 'qml', 'qmljs' },
    root_markers = { '.git', '.ini' },
    capabilities = {
        semanticTokensProvider = false,
        require('cmp_nvim_lsp').default_capabilities()
    }
}
