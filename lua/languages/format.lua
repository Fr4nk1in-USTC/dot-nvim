local status, null_ls = pcall(require, "null-ls")

if not status then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting

local sources = {
	formatting.autopep8,
	formatting.stylua,
	formatting.shfmt,
	formatting.clang_format.with({
		extra_args = { "-style=file" },
		prefer_local = "/usr/loacl/bin/clang-format",
	}),
	formatting.latexindent,
	formatting.prettier,
	formatting.rustfmt,
	formatting.xmllint,
}

null_ls.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})

local map = require("mappings").map

map("n", "<A-f>", vim.lsp.buf.formatting, nil, "Format document")
