local status, toggleterm = pcall(require, "toggleterm")
if not status then
	return
end

toggleterm.setup({
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

local map = require("mappings").map

map("n", "<C-v>", ":ToggleTerm direction=vertical<CR>", nil, "Open vertical ToggleTerm")
map("n", "<C-h>", ":ToggleTerm direction=horizontal<CR>", nil, "Open horizontal ToggleTerm")
