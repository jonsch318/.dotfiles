local M = {}

--- setup outsourced from lsp config for clarification
---@param base_on_attach  function The on_attach function that should be merged
---@param capabilities any The capabilities that should be merged
---@return any
M.setup = function(base_on_attach, capabilities)
	local schemas = require("schemastore").yaml.schemas()


	-- Add custom schemas
	schemas["kubernetes"] = "k8s/**/*yaml"
	-- schemas[require("kubernetes").yamlls_schema()] = "*.yaml"
	schemas["https://www.talos.dev/v1.9/schemas/config.schema.json"] = "talos_*.yaml"
	--schemas["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml"


	return {
		on_attach = base_on_attach,
		capabilities = capabilities,
		-- on_new_config = function(new_config)
		-- 	new_config.settings.yaml.schemas = vim.tbl_deep_extend(
		-- 		"force",
		-- 		new_config.settings.yaml.schemas or {},
		-- 		require("schemastore").yaml.schemas()
		-- 	)
		-- end,
		settings = {
			yaml = {
				keyOrdering = false,
				format = {
					enable = true,
				},
				validate = true,
				schemaStore = {
					enable = false,
					url = "",
				},
				schemas = schemas
			}
		}
	}
end

return M
