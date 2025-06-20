return {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	settings = {
		vtsls = {
			enableMoveToFileCodeAction = true,
			autoUseWorkspaceTsdk = true,
			experimental = {
				maxInlayHintLength = 15,
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
	},
}
