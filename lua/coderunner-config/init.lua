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
local function opts_desc(descriptions)
	return {
		noremap = true,
		silent = true,
		desc = descriptions,
	}
end

map("n", "<leader>rc", ":RunCode<CR>", opts_desc("Run file or project"))
map("n", "<leader>rf", ":RunFile<CR>", opts_desc("Run file"))
map("n", "<leader>rt", ":RunFile tab<CR>", opts_desc("Run file in a new tab"))
map("n", "<leader>rp", ":RunProject<CR>", opts_desc("Run project"))
map("n", "<leader>rc", ":RunClose<CR>", opts_desc("Close runner"))
map("n", "<leader>crf", ":CRFiletype<CR>", opts_desc("Open json with supported files"))
map("n", "<leader>crp", ":CRProjects<CR>", opts_desc("Open json with list of projects"))
