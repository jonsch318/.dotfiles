return {
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		opts = {
			inlay_hints = { enabled = true },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
					end
					-- whatever other lsp config you want
				end,
			})

			-- ##### SETUP #####
			-- Lua
			vim.lsp.enable("lua_ls")

			-- JavaScript/TypeScript
			vim.lsp.enable("vtsls")

			-- tailwindcss
			vim.lsp.enable("tailwindcss")

			-- svelte
			vim.lsp.enable("svelte")

			-- html
			vim.lsp.enable("html")

			-- htmx
			vim.lsp.enable("htmx")
			vim.lsp.config("htmx", { filetypes = { "templ" } })

			-- templ
			vim.lsp.enable("templ")

			-- EMMET
			vim.lsp.enable("emmet-language-server")

			-- GO
			vim.lsp.enable("gopls")

			-- HASKELL
			-- Own Plugin

			-- Rust
			-- Own Plugin

			-- C/C++
			vim.lsp.enable("clangd")
			vim.lsp.enable("neocmake")
			vim.lsp.enable("masonlsp")

			-- Texting

			vim.lsp.enable("tinymist")
			vim.lsp.enable("ltex")
			vim.lsp.enable("texlab")
			vim.lsp.enable("vale_ls")
			vim.lsp.enable("harper_ls")
			vim.lsp.enable("typos_lsp")

			-- SQL
			vim.lsp.enable("sqls")

			-- PYTHON
			vim.lsp.enable("ruff")
			vim.lsp.enable("pyright")

			-- Docker
			vim.lsp.enable("dockerls")
			vim.lsp.enable("docker_compose_language_service")

			--- CONFIGURATION LANGS
			vim.lsp.enable("yamlls")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("jsonnet_ls")
			vim.lsp.enable("ansiblels")
			vim.lsp.enable("helm_ls")
			vim.lsp.enable("hyprls")
			vim.lsp.enable("terraformls")

			-- Gitlab Ci
			vim.lsp.enable("gitlab_ci_ls")

			-- BASH/ZSH/SH?
			vim.lsp.enable("bashls")

			-- starlark
			vim.lsp.enable("starpls")
			vim.lsp.enable("bzl")
		end,
	},
}
