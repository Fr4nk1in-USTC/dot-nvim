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

local map = require("mappings").map

map("n", "<leader>rc", ":RunCode<CR>", nil, "Run file or project")
map("n", "<leader>rf", ":RunFile<CR>", nil, "Run file")
map("n", "<leader>rt", ":RunFile tab<CR>", nil, "Run file in a new tab")
map("n", "<leader>rp", ":RunProject<CR>", nil, "Run project")
map("n", "<leader>rc", ":RunClose<CR>", nil, "Close runner")
map("n", "<leader>crf", ":CRFiletype<CR>", nil, "Open json with supported files")
map("n", "<leader>crp", ":CRProjects<CR>", nil, "Open json with list of projects")
