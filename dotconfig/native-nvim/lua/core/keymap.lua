local map = vim.keymap.set


-- Window Navigation
map({ "n" }, "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map({ "n" }, "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map({ "n" }, "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map({ "n" }, "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Move Lines
map({ "n" }, "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map({ "n" }, "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map({ "v" }, "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map({ "v" }, "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map('n', "-", ":Oil<CR>")
-- map("i", "<C-e>", function()
-- 	require("luasnip").expand_or_jump(1)
-- end, { silent = true })

-- fzf-lua keymaps
map('n', "<leader>fg", function()
  require("fzf-lua").live_grep()
end, { desc = "Live-Grep (fzf-lua)" })

map('n', "<leader>fG", function()
  require("fzf-lua").grep()
end, { desc = "Grep (fzf-lua)" })

map('n', "<leader>fw", function()
  require("fzf-lua").grep_cword()
end, { desc = "Word-Grep (fzf-lua)" })

map('n', "<leader>fW", function()
  require("fzf-lua").grep_cWORD()
end, { desc = "WORD-Grep (fzf-lua)" })

map('n', "<leader>fb", function()
  require("fzf-lua").buffers()
end, { desc = "Buffers (fzf-lua)" })

map('n', "<leader>fs", function()
  require("fzf-lua").files()
end, { desc = "Files (fzf-lua)" })

map('n', "<leader><space>", function()
  require("fzf-lua").files()
end, { desc = "Files" })

map('n', "<leader>fr", function()
  require("fzf-lua").resume()
end, { desc = "Resume fzf-lua" })

map('n', "<leader>fm", function()
  require("fzf-lua").keymaps()
end, { desc = "keymaps (fzf-lua)" })

map('n', "<C-/>", function()
  require("fzf-lua").keymaps()
end, { desc = "keymaps (fzf-lua)" })

-- LSP MAP
vim.keymap.del("n", "gra")
map("n", "gra", function()
  require("fzf-lua").lsp_code_actions()
end, { desc = "Code Actions" })
map("n", "<F2>", vim.lsp.buf.rename, { silent = true, desc = "Rename" })

-- GOTO
map("n", "grd", function()
  require("fzf-lua").lsp_definitions()
end, { desc = "Goto Definitions" })

map("n", "grD", function()
  require("fzf-lua").lsp_declarations()
end, { desc = "Goto Definitions" })

vim.keymap.del("n", "grr")
map("n", "grr", function()
  require("fzf-lua").lsp_references()
end, { desc = "Goto References" })

vim.keymap.del("n", "gri")
map("n", "gri", function()
  require("fzf-lua").lsp_implementations()
end, { desc = "Goto References" })

map("n", "grf", function()
  require("fzf-lua").lsp_finder()
end, { desc = "Finder" })

map("n", "grF", function()
  vim.lsp.buf.format()
end, { desc = "Finder" })

map("n", "grt", function()
  require("fzf-lua").lsp_typedefs()
end, { desc = "Typedefs" })

map("n", "grc", function()
  require("fzf-lua").lsp_incoming_calls()
end, { desc = "Goto Incoming Calls" })
map("n", "grC", function()
  require("fzf-lua").lsp_outgoing_calls()
end, { desc = "Goto Outgoing Calls" })

map("n", "grs", function()
  require("fzf-lua").lsp_document_symbols()
end, { desc = "Document Symbols" })

-- Hover

map("i", "<C-K>", vim.lsp.buf.signature_help, { silent = true, desc = "Hover Signature Help" })

require("fzf-lua").register_ui_select()
