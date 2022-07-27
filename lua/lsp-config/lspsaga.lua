local saga = require("lspsaga")

-- change the lsp symbol kind
local kind = require("lspsaga.lspkind")

saga.init_lsp_saga({
	border_style = "rounded",
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
map("n", "gs", require("lspsaga.signaturehelp").signature_help, opts)

-- rename
map("n", "gr", require("lspsaga.rename").lsp_rename, opts)

-- preview definition
map("n", "pd", require("lspsaga.definition").preview_definition, opts)

-- diagnostics
map("n", "<leader>cd", require("lspsaga.diagnostic").show_line_diagnostics, opts)
map("n", "[e", require("lspsaga.diagnostic").goto_prev, opts)
map("n", "]e", require("lspsaga.diagnostic").goto_next, opts)
map("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
map("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)

-- terminal
-- float terminal also you can pass the cli command in open_float_terminal function
map("n", "<C-\\>", function()
	require("lspsaga.floaterm").open_float_terminal("zsh")
end, opts)
map("t", "<C-\\>", function()
	-- vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true))
	require("lspsaga.floaterm").close_float_terminal()
end, { silent = true })
