return {
    cmd = { "vscode-json-language-server" },
    filetypes = { "json", "jsonc" },
    rootmarkers = { ".git" },
    init_options = {
        provideFormatter = true,
    },
}
