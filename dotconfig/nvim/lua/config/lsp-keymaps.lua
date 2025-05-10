-- -- Code Actions
-- vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { silent = true, desc = "Rename" })
-- -- GOTO
-- -- vim.keymap.set("n", "grd", function()
-- -- 	require("fzf-lua").lsp_definitions()
-- -- end, { silent = true, desc = "Goto References" })
-- -- vim.keymap.set("n", "grD", function()
-- -- 	require("fzf-lua").lsp_declarations()
-- -- end, { silent = true, desc = "Goto References" })
-- vim.keymap.del("n", "grr")
-- vim.deymap.set("n", "grr", "<CMD>FzfLua lsp_references<CR>, { silent = true, desc = "Goto References" })
--

-- Actions

vim.keymap.del("n", "gra")
vim.keymap.set("n", "gra", function()
	require("fzf-lua").lsp_code_actions()
end, { desc = "Code Actions" })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { silent = true, desc = "Rename" })

-- GOTO
vim.keymap.set("n", "grd", function()
	require("fzf-lua").lsp_definitions()
end, { desc = "Goto Definitions" })

vim.keymap.set("n", "grD", function()
	require("fzf-lua").lsp_declarations()
end, { desc = "Goto Definitions" })

vim.keymap.del("n", "grr")
vim.keymap.set("n", "grr", function()
	require("fzf-lua").lsp_references()
end, { desc = "Goto References" })

vim.keymap.del("n", "gri")
vim.keymap.set("n", "gri", function()
	require("fzf-lua").lsp_implementations()
end, { desc = "Goto References" })

vim.keymap.set("n", "grf", function()
	require("fzf-lua").lsp_finder()
end, { desc = "Finder" })

vim.keymap.set("n", "grt", function()
	require("fzf-lua").lsp_typedefs()
end, { desc = "Typedefs" })

vim.keymap.set("n", "grc", function()
	require("fzf-lua").lsp_incoming_calls()
end, { desc = "Goto Incoming Calls" })
vim.keymap.set("n", "grC", function()
	require("fzf-lua").lsp_outgoing_calls()
end, { desc = "Goto Outgoing Calls" })
-- Hover

vim.keymap.set("i", "<C-K>", vim.lsp.buf.signature_help, { silent = true, desc = "Hover Signature Help" })
