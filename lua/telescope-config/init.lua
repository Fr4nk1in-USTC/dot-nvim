local map = vim.api.nvim_set_keymap
local function opts_desc(description)
	return {
		noremap = true,
		silent = true,
		desc = description,
	}
end

require("telescope").setup({
	require("telescope").load_extension("lazygit"),
})

map("n", "<leader>ft", ":Telescope<CR>", opts_desc("Open Telescope"))
map("n", "<leader>ff", ":Telescope find_files<CR>", opts_desc("Open Telescope find_files"))
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts_desc("Open Telescope live_grep"))
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts_desc("Open Telescope help_tags"))
