-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local function opts_desc(description)
	return {
		noremap = true,
		silent = true,
		desc = description,
	}
end
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts_desc("Open diagnostics window"))
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts_desc("Go to previous diagnostic"))
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts_desc("Go to next diagnostic"))
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts_desc("Open diagnostic location list"))

-- Set diagnostic appearance.
require("lsp_lines").setup()

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	update_in_insert = true,
})

vim.keymap.set("", "<Leader>l", function()
	local status = vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({
		virtual_text = status,
		virtual_lines = not status,
		update_in_insert = status,
	})
end, { desc = "Toggle lsp_lines" })

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
	local function bufopts_desc(description)
		return {
			noremap = true,
			silent = true,
			buffer = bufnr,
			desc = description,
		}
	end
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts_desc("Go to declaration"))
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts_desc("Go to definition"))
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts_desc("Go to implementation"))
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts_desc("Go to type definition"))
	vim.keymap.set("n", "gR", vim.lsp.buf.references, bufopts_desc("Find references"))
	vim.keymap.set("n", "<A-f>", vim.lsp.buf.formatting, bufopts_desc("Format document"))

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
