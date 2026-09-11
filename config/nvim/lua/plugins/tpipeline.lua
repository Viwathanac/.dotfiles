local M = {
    "vimpostor/vim-tpipeline",
}

function M.config()
    vim.g.tpipeline_autoembed = 1
    vim.g.tpipeline_restore = 1
    vim.g.tpipeline_clearstl = 1
end

return M
