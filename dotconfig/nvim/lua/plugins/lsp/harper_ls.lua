local M = {}

M.setup = function(base_on_attach, capabilities)
    return {
        on_attach = base_on_attach,
        capabilities = capabilities,
        settings = {
            ["harper-ls"] = {
                fileDictPath = "~/.local/share/harper-ls/file_dictionaries",
                userDictPath = vim.fn.stdpath("config") .. "/spell/en.utf-8.add",
            }
        },
    }
end

return M
