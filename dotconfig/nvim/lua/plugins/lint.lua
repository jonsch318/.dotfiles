return {
	{
		-- TODO: kubelinter
		"mfussenegger/nvim-lint",
		event = { "BufWritePost", "BufNewFile" },
		config = function(_, _opts)
			require("lint").linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				-- javascript = { "biomejs" },
				-- typescript = { "biomejs" },
				-- javascriptreact = { "biomejs" },
				-- typescriptreact = { "biomejs" },
				-- svelte = { "biome" },
				svelte = { "eslint_d" },
				go = { "golangcilint" },
				cmake = { "cmakelint" },
				sql = { "sqlfluff" },
				starlark = { "buildifier" },
				bzl = { "buildifier" },
				dockerfile = { "hadolint" },
				yaml = { "yamllint" },
				["yaml.ghaction"] = { "actionlint" },
			}

			require("lint").linters.sqlfluff.args = {
				"lint",
				"--format=json",
			}

			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})

			vim.api.nvim_buf_create_user_command(0, "LintRunning", function()
				require("lint").get_running()
			end, { desc = "See running nvim-lint linters" })
		end,
	},
}
