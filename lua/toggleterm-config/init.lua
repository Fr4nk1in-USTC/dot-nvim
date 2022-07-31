require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.25
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
local function opts_desc(description)
	return {
		noremap = true,
		silent = true,
		desc = description,
	}
end

map("n", "<C-v>", ":ToggleTerm direction=vertical<CR>", opts_desc("Open vertical ToggleTerm"))
map("n", "<C-h>", ":ToggleTerm direction=horizontal<CR>", opts_desc("Open horizontal ToggleTerm"))
