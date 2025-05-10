---@module "filetypes"
---@author Jonas Schneider
---@license MIT

local M = {}

local function is_helm()
    local filepath = vim.fn.expand("%:p")
    local filename = vim.fn.expand("%:t")

    if filepath:match("/templates/.%.(ya?ml|tpl|txt)") then
        return true
    end


    -- Check if file is helmfile templated values
    if filename:match(".*%.gotmpl$") then
        return true
    end

    -- Check if file is helmfile.yaml or variations like helmfile-my.yaml
    if filename:match("(helmfile).*%.ya?ml$") then
        return true
    end
    return false
end

--- Registers custom filetypes to nvim at startup
M.register_filetypes = function()
    vim.filetype.add {
        extension = {
            mdx = "mdx",
        },
    }
    vim.filetype.add {
        pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
    }

    -- YAML
    vim.filetype.add {
        extension = {
            yml = "yaml.ansible"
        },
        pattern = {
            [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
            [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
            [".*/group_vars/.*/.*%.ya?ml"] = "yaml.ansible",
            [".*/playbook.*%.ya?ml"] = "yaml.ansible",
            [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
            [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
            [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
            [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
            [".*/molecule/.*%.ya?ml"] = "yaml.ansible",
            [".*/ansible/.*%.yml"] = "yaml.ansible"
        }
    }

    vim.filetype.add {
        pattern = {
            [".*/%.gitlab%-ci.*%.ya?ml"] = "yaml.gitlab"
        }
    }

    vim.filetype.add {
        pattern = {
            [".*/docker%-compose%.ya?ml"] = "yaml.docker-compose",
            [".*/compose%.ya?ml"] = "yaml.docker-compose"
        }
    }


    -- FIX: Since openTofu have no language server themselvs revert to terraform
    vim.filetype.add {
        extension = {
            tf = "terraform"
        }
    }


    -- HELM
    vim.filetype.add({
        pattern = {
            [".*/templates/.*%.yaml"] = "helm",
            [".*/Chart%.yaml"] = "helm",
        },
        filename = {
            ["values.yaml"] = function(path)
                local dir = vim.fn.fnamemodify(path, ":h")
                local chart_yaml = dir .. "/Chart.yaml"
                if vim.fn.filereadable(chart_yaml) == 1 then
                    return "helm"
                end
                return "yaml"
            end
        }
    })
end

--- Setup treesitter config of new custom filetypes
M.treesitter_setup = function()
    vim.treesitter.language.register("markdown", "mdx") -- register markdown parser to new mdx filetype
end

--- DOTFILES ---
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "dot*",
    callback = function()
        local name = vim.fn.expand('%:t'):gsub('^dot', '.')
        vim.cmd('doautocmd filetypedetect BufRead ' .. name)
    end
})


return M
