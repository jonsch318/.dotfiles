local schemas = require("schemastore").yaml.schemas()

-- Add custom schemas
schemas["kubernetes"] = "k8s/**/*yaml"
-- schemas[require("kubernetes").yamlls_schema()] = "*.yaml"
schemas["https://www.talos.dev/v1.9/schemas/config.schema.json"] = "talos_*.yaml"
schemas["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml"

return {
	settings = {
		yaml = {
			redhat = { telemetry = { enabled = false } },
			keyOrdering = false,
			format = {
				enable = true,
			},
			validate = true,
			schemaStore = {
				enable = false,
				url = "",
			},
			schemas = schemas,
		},
	},
}
