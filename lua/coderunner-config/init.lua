require("code_runner").setup({
	-- put here the commands by filetype
	filetype = {
		python = "python3 -u $dir/$fileName",
		c = "cd $dir && gcc -O2 -Wall -o $fileNameWithoutExt $fileName && $dir/$fileNameWithoutExt",
		cpp = "cd $dir && g++ -O2 -Wall -o $fileNameWithoutExt $fileName && $dir/$fileNameWithoutExt",
	},
	startinsert = true,
	mode = "float",
	float = {
		border = "rounded",
	},
})

local map = vim.keymap.set
local opts = { noremap = true, silent = false }

map("n", "<leader>r", ":RunFile<CR>", opts)
map("n", "<leader>rft", ":RunFile tab<CR>", opts)
map("n", "<leader>rp", ":RunProject<CR>", opts)
map("n", "<leader>rc", ":RunClose<CR>", opts)
map("n", "<leader>crf", ":CRFiletype<CR>", opts)
map("n", "<leader>crp", ":CRProjects<CR>", opts)
