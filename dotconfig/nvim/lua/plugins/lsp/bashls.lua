local M = {}

M.setup = function(base_on_attach, capabilities)
    return {
        on_attach = base_on_attach,
        capabilities = capabilities,
        filetypes = { "bash", "sh", "zsh" }
    }
end

return M
