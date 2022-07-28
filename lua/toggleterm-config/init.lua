require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<c-\>]],
	direction = "float",
	float_opts = {
		border = "curved",
		width = function(term)
			return math.floor(vim.o.columns * 0.8)
		end,
		height = function(term)
			return math.floor(vim.o.lines * 0.8)
		end,
	},
	winbar = {
		enabled = true,
	},
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("t", "<esc>", "<C-\\><C-n>", opts)
map("n", "<C-v>", ":ToggleTerm direction=vertical<CR>", opts)
map("n", "<C-h>", ":ToggleTerm direction=horizontal<CR>", opts)
