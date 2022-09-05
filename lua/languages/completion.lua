-- check if nvim-cmp is installed
local status, cmp = pcall(require, "cmp")

if not status then
	return
end
---- nvim-cmp source
local cmp_sources = {}
if pcall(require, "cmp_path") then
	table.insert(cmp_sources, { name = "path" })
end
if pcall(require, "cmp_nvim_lsp") then
	table.insert(cmp_sources, { name = "nvim_lsp" })
end

-- luasnip & its setup
local luasnip_status, luasnip = pcall(require, "luasnip")
---- nvim-cmp expand snippet
local expand_snippet

if luasnip_status then
	expand_snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	}
	table.insert(cmp_sources, { name = "luasnip" })
else
	expand_snippet = {}
end

---- select next completion item
local select_next
if luasnip_status then
	select_next = function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		else
			fallback()
		end
	end
else
	select_next = function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		else
			fallback()
		end
	end
end
---- select previous completion item
local select_prev
if luasnip_status then
	select_prev = function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end
else
	select_prev = function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		else
			fallback()
		end
	end
end

-- lspkind & its setup
local lspkind_status, lspkind = pcall(require, "lspkind")
---- lspkind format
local formatting
if lspkind_status then
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	}
else
	formatting = {}
end

-- nvim-cmp setup
cmp.setup({
	enabled = function()
		-- disable completion in comments
		local context = require("cmp.config.context")
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,
	snippet = expand_snippet,
	window = {
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<Tab>"] = cmp.mapping(select_next, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(select_prev, { "i", "s" }),
	}),
	sources = cmp_sources,
	formatting = formatting,
})
