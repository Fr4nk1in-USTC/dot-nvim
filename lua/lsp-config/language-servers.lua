-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local map = require("mappings").map

map("n", "<space>e", vim.diagnostic.open_float, nil, "Open diagnostics window")
map("n", "[d", vim.diagnostic.goto_prev, nil, "Go to previous diagnostic")
map("n", "]d", vim.diagnostic.goto_next, nil, "Go to next diagnostic")
map("n", "<space>q", vim.diagnostic.setloclist, nil, "Open diagnostic location list")

-- Set diagnostic appearance.
require("lsp_lines").setup()

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	update_in_insert = true,
})

map("", "<Leader>l", function()
	local status = vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({
		virtual_text = status,
		virtual_lines = not status,
		update_in_insert = status,
	})
end, {}, "Toggle lsp_lines")

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Lsp_signature
	require("lsp_signature").on_attach({
		toggle_key = "<C-s>",
	})

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = {
		noremap = true,
		silent = true,
		buffer = bufnr,
	}

	map("n", "gD", vim.lsp.buf.declaration, bufopts, "Go to declaration")
	map("n", "gd", vim.lsp.buf.definition, bufopts, "Go to definition")
	map("n", "gi", vim.lsp.buf.implementation, bufopts, "Go to implementation")
	map("n", "<space>D", vim.lsp.buf.type_definition, bufopts, "Go to type definition")
	map("n", "gR", vim.lsp.buf.references, bufopts, "Find references")
	map("n", "<A-f>", vim.lsp.buf.formatting, bufopts, "Format document")

	client.resolved_capabilities.document_formatting = false
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Installer
require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"bash-language-server",
		"lua-language-server",
		"vim-language-server",
		"json-lsp",
		"pyright",
		"clangd",
	},
	automatic_installation = true,
})

local clangd_capabilities = capabilities
clangd_capabilities.textDocument.semanticHighlighting = true
clangd_capabilities.offsetEncoding = "utf-8"

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
		})
	end,
	["clangd"] = function()
		require("lspconfig").clangd.setup({
			on_attach = on_attach,
			capabilities = clangd_capabilities,
			flags = lsp_flags,
		})
	end,
})
