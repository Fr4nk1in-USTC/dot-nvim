local saga = require("lspsaga")

-- change the lsp symbol kind
local kind = require("lspsaga.lspkind")

saga.init_lsp_saga({
	border_style = "rounded",
	saga_winblend = 10,
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- finder
map("n", "gf", require("lspsaga.finder").lsp_finder, opts)

-- code action
map("n", "<leader>ca", require("lspsaga.codeaction").code_action, opts)
map("v", "<leader>ca", function()
	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
	require("lspsaga.codeaction").range_code_action()
end, opts)

-- hover doc
map("n", "K", require("lspsaga.hover").render_hover_doc, { silent = true })
-- scroll down hover doc or scroll in definition preview
map("n", "<C-f>", function()
	require("lspsaga.action").smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
map("n", "<C-b>", function()
	require("lspsaga.action").smart_scroll_with_saga(-1)
end, { silent = true })

-- signature help
map("n", "<C-s>", require("lspsaga.signaturehelp").signature_help, opts)

-- rename
map("n", "gr", require("lspsaga.rename").lsp_rename, opts)

-- preview definition
map("n", "gpd", require("lspsaga.definition").preview_definition, opts)

-- diagnostics
map("n", "<leader>d", require("lspsaga.diagnostic").show_line_diagnostics, opts)
map("n", "[e", require("lspsaga.diagnostic").goto_prev, opts)
map("n", "]e", require("lspsaga.diagnostic").goto_next, opts)
map("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
map("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)
