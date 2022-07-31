local map = vim.api.nvim_set_keymap
local function opts_desc(description)
	return {
		noremap = true,
		silent = true,
		desc = description,
	}
end

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
