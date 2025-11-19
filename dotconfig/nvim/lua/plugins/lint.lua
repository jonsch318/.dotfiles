return {
	{
		-- TODO: kubelinter
		"mfussenegger/nvim-lint",
		event = { "BufWritePost", "BufNewFile" },
		config = function(_, _opts)
			require("lint").linters_by_ft = {
				lua = { "luacheck" },
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
