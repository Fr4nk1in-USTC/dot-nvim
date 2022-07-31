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

local map = vim.keymap.set
local function opts_desc(description)
	return {
		noremap = true,
		silent = true,
		desc = description,
	}
end

-- finder
map("n", "gf", require("lspsaga.finder").lsp_finder, opts_desc("Open lspsaga finder"))

-- code action
map("n", "<leader>ca", require("lspsaga.codeaction").code_action, opts_desc("Show code actions"))
map("v", "<leader>ca", function()
	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
	require("lspsaga.codeaction").range_code_action()
end, opts_desc("Show code actions for range"))

-- hover doc
map("n", "K", require("lspsaga.hover").render_hover_doc, opts_desc("Show hover doc"))
-- scroll down hover doc or scroll in definition preview
map("n", "<C-f>", function()
	require("lspsaga.action").smart_scroll_with_saga(1)
end, opts_desc("Scroll down hover doc or scroll in definition preview"))
-- scroll up hover doc
map("n", "<C-b>", function()
	require("lspsaga.action").smart_scroll_with_saga(-1)
end, opts_desc("Scroll up hover doc or scroll in definition preview"))

-- signature help
map("n", "<C-s>", require("lspsaga.signaturehelp").signature_help, opts_desc("Show signature help"))

-- rename
map("n", "gr", require("lspsaga.rename").lsp_rename, opts_desc("Rename symbol"))

-- preview definition
map("n", "gpd", require("lspsaga.definition").preview_definition, opts_desc("Preview definition"))

-- diagnostics
map("n", "<leader>d", require("lspsaga.diagnostic").show_line_diagnostics, opts_desc("Show line diagnostics"))
map("n", "[e", require("lspsaga.diagnostic").goto_prev, opts_desc("Goto previous diagnostic"))
map("n", "]e", require("lspsaga.diagnostic").goto_next, opts_desc("Goto next diagnostic"))
map("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts_desc("Goto previous error"))
map("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts_desc("Goto next error"))
