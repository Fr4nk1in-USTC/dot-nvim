local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>nt", ":NvimTreeToggle<CR>", opts)

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	open_on_setup = true,
	view = {
		adaptive_size = true,
		mappings = {
			list = { {
				key = "u",
				action = "dir_up",
			} },
		},
	},
	git = {
		enable = true,
		ignore = false,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	diagnostics = {
		enable = true,
	},
})
