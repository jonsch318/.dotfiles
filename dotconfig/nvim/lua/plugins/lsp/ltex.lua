local M = {}

M.setup = function(base_on_attach, capabilities)
	return {
		on_attach = function(client, buffer)
			base_on_attach(client, buffer)
			require("ltex_extra").setup({
				path = vim.fn.expand("~") .. "/.local/share/ltex"
			})
		end,
		capabilities = capabilities,
		filetypes = {
			"latex",
			"tex",
			"bibtex",
		},
	}
end

return M
