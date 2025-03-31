return {
	{
		"j-hui/fidget.nvim",
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
			require("mason").setup()
			require("mason-lspconfig").setup()

			-- ##### Diagnostics #####
			-- Set up cool signs for diagnostics
			local signs = { Error = " ", Warn = " ", Info = " ", Hint = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- Diagnostic config
			local config = {
				virtual_text = {
					severity = {
						min = vim.diagnostic.severity.INFO,
					},
				},
				virtual_lines = {
					current_line = true,
					severity = {
						min = vim.diagnostic.severity.INFO,
					},
				},
				signs = {
					active = signs,
				},
				update_in_insert = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			}
			vim.diagnostic.config(config)

			local base_on_attach = function(client, buffer)
				-- require("config.lsp-keymaps").on_attach(client, buffer)

				if client.server_capabilities.inlayHintProvider then
					vim.g.inlay_hints_visible = true
					vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
				end
				vim.api.nvim_buf_create_user_command(buffer, "LSPFormat", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP formatter" })
			end

			-- Broadcast additional completion capabilities to servers
			local capabilities = {}
			capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

			-- ##### SETUP #####
			local lspconfig = require("lspconfig")

			-- JavaScript/TypeScript(react)
			lspconfig.vtsls.setup(require("plugins.lsp.vtsls").setup(base_on_attach, capabilities))

			lspconfig.tailwindcss.setup({
				on_attach = base_on_attach,
				capabilities = capabilities,
			})

			-- SVELTE
			lspconfig.svelte.setup({
				on_attach = base_on_attach,
				capabilities = capabilities,
			})

			--HTML
			lspconfig.html.setup(require("plugins.lsp.html").setup(base_on_attach, capabilities))

			-- EMMET
			lspconfig.emmet_ls.setup(require("plugins.lsp.emmet").setup(base_on_attach, capabilities))

			-- GO
			lspconfig.gopls.setup(require("plugins.lsp.go").setup(base_on_attach, capabilities))

			-- HASKELL
			lspconfig.hls = function()
				return true
			end

			-- RUST
			--lspconfig.rust_analyzer.setup(require("plugins.lsp.rust_analyzer").setup(base_on_attach, capabilities))

			-- C/C++
			lspconfig.clangd.setup(require("plugins.lsp.clangd").setup(base_on_attach, capabilities))

			lspconfig.neocmake.setup({
				on_attach = base_on_attach,
				capabilities = capabilities,
			})

			lspconfig.mesonlsp.setup({
				on_attach = base_on_attach,
				capabilities = capabilities,
			})
			-- TYPST
			lspconfig.tinymist.setup(require("plugins.lsp.tinymist").setup(base_on_attach, capabilities))

			-- SQL
			lspconfig.sqls.setup({
				on_attach = base_on_attach,
				capabilities = capabilities,
			})

			-- PYTHON
			lspconfig.ruff.setup({
				on_attach = base_on_attach,
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				on_attach = base_on_attach,
				capabilities = capabilities,
			})

			lspconfig.dockerls.setup(require("plugins.lsp.dockerls").setup(base_on_attach, capabilities))

			--- CONFIGURATION LANGS
			--- These require dotted filetypes like yaml.ansible / yaml.gitlab etc.. These filetypes and their patterns are registered in config/filetypes.lua for now
			-- YAML
			lspconfig.yamlls.setup(require("plugins.lsp.yamlls").setup(base_on_attach, capabilities))

			-- vim.api.nvim_create_autocmd("Filetype", {
			-- 	pattern = "yaml",
			-- 	callback = function()
			-- 		vim.lsp.start({
			-- 			name = "yamlls",
			-- 			cmd = { "yamlls" },
			-- 			root_dir = vim.fs.dirname(vim.fs.find(".git", { upward = true, path = vim.api.nvim_buf_get_name(0) })[1]),
			-- 		})
			-- 	end
			-- })

			-- JSON
			lspconfig.jsonls.setup(require("plugins.lsp.jsonls").setup(base_on_attach, capabilities))

			-- JSONNET
			lspconfig.jsonnet_ls.setup({
				base_on_attach = base_on_attach,
				capabilities = capabilities,
			})

			-- Ansible
			lspconfig.ansiblels.setup(require("plugins.lsp.ansiblels").setup(base_on_attach, capabilities))

			-- Docker Compose
			lspconfig.docker_compose_language_service.setup(
				require("plugins.lsp.docker_compose_language_service").setup(base_on_attach, capabilities)
			)

			-- Gitlab Ci
			lspconfig.gitlab_ci_ls.setup(require("plugins.lsp.gitlab_ci_ls").setup(base_on_attach, capabilities))

			--HELM
			lspconfig.helm_ls.setup(require("plugins.lsp.helm_ls").setup(base_on_attach, capabilities))

			-- hyprls
			lspconfig.hyprls.setup({
				on_attach = base_on_attach,
				capabilities = capabilities,
			})

			lspconfig.terraformls.setup(require("plugins.lsp.terraformls").setup(base_on_attach, capabilities))

			--- OTHER:

			-- BASH/ZSH/SH?
			--lspconfig.bashls.setup(require("plugins.lsp.bashls").setup(base_on_attach, capabilities))
			lspconfig.bashls.setup({
				on_attach = base_on_attach,
				capabilities = capabilities,
			})

			-- starlark
			lspconfig.starpls.setup({
				on_attach = base_on_attach,
				capabilities = capabilities,
			})

			lspconfig.bzl.setup({
				on_attach = base_on_attach,
				capabilities = capabilities,
			})

			-- tex
			lspconfig.texlab.setup({
				on_attach = base_on_attach,
				capabilities = capabilities,
			})

			lspconfig.ltex.setup(require("plugins.lsp.ltex").setup(base_on_attach, capabilities))

			-- lspconfig.ltex_plus.setup(require("plugins.lsp.ltex_plus").setup(base_on_attach, capabilities))

			-- lspconfig.vale_ls.setup {
			--     on_attach = base_on_attach,
			--     capabilities = capabilities,
			-- }
			lspconfig.harper_ls.setup(require("plugins.lsp.harper_ls").setup(base_on_attach, capabilities))
			lspconfig.typos_lsp.setup(require("plugins.lsp.typos_lsp").setup(base_on_attach, capabilities))

			-- LUA
			lspconfig.lua_ls.setup({
				on_attach = base_on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
								[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
							},
							maxPreload = 100000,
							preloadFileSize = 10000,
						},
					},
				},
			})
		end,
	},
}
