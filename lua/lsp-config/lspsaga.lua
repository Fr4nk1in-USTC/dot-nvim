local saga = require("lspsaga")

saga.init_lsp_saga({
	border_style = "rounded",
	saga_winblend = 10,
	code_action_icon = "💡",
	code_action_lightbulb = {
		enable = true,
		sign = false,
		enable_in_insert = false,
		sign_priority = 20,
		virtual_text = true,
	},
})

local map = require("mappings").map

-- finder
map("n", "gf", require("lspsaga.finder").lsp_finder, nil, "Open lspsaga finder")

-- code action
map("n", "<leader>ca", require("lspsaga.codeaction").code_action, nil, "Show code actions")
map("v", "<leader>ca", function()
	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
	require("lspsaga.codeaction").range_code_action()
end, nil, "Show code actions for range")

-- hover doc
map("n", "K", require("lspsaga.hover").render_hover_doc, nil, "Show hover doc")
-- scroll down hover doc or scroll in definition preview
map("n", "<C-f>", function()
	require("lspsaga.action").smart_scroll_with_saga(1)
end, nil, "Scroll down hover doc or scroll in definition preview")
-- scroll up hover doc
map("n", "<C-b>", function()
	require("lspsaga.action").smart_scroll_with_saga(-1)
end, nil, "Scroll up hover doc or scroll in definition preview")

-- signature help
map("n", "<C-s>", require("lspsaga.signaturehelp").signature_help, nil, "Show signature help")

-- rename
map("n", "gr", require("lspsaga.rename").lsp_rename, nil, "Rename symbol")

-- preview definition
map("n", "gpd", require("lspsaga.definition").preview_definition, nil, "Preview definition")

-- diagnostics
map("n", "<leader>d", require("lspsaga.diagnostic").show_line_diagnostics, nil, "Show line diagnostics")
map("n", "[e", require("lspsaga.diagnostic").goto_prev, nil, "Goto previous diagnostic")
map("n", "]e", require("lspsaga.diagnostic").goto_next, nil, "Goto next diagnostic")
map("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, nil, "Goto previous error")
map("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, nil, "Goto next error")
