local map = require("mappings").map

require("telescope").setup({
	require("telescope").load_extension("lazygit"),
})

map("n", "<leader>ft", ":Telescope<CR>", nil, "Open Telescope")
map("n", "<leader>ff", ":Telescope find_files<CR>", nil, "Open Telescope find_files")
map("n", "<leader>fg", ":Telescope live_grep<CR>", nil, "Open Telescope live_grep")
map("n", "<leader>fh", ":Telescope help_tags<CR>", nil, "Open Telescope help_tags")
map("n", "<leader>fm", ":Telescope keymaps<CR>", nil, "Open keymap help")
