local status, telescope = pcall(require, "telescope")
if not status then
	return
end

-- load extensions
local config = {}
local extensions = {
	"lazygit",
	"notify",
	-- "media_files"
}
for _, ext in pairs(extensions) do
	local ext_status, _ = pcall(require, "telescope._extension." .. ext)
	if ext_status then
		table.insert(config, telescope.load_extension(ext))
	end
end

require("telescope").setup(config)

-- Keymapping
local map = require("helper.mapping").map

map("n", "<leader>ft", ":Telescope<CR>", nil, "Open Telescope")
map("n", "<leader>ff", ":Telescope find_files<CR>", nil, "Open Telescope find_files")
map("n", "<leader>fg", ":Telescope live_grep<CR>", nil, "Open Telescope live_grep")
map("n", "<leader>fh", ":Telescope help_tags<CR>", nil, "Open Telescope help_tags")
map("n", "<leader>fm", ":Telescope keymaps<CR>", nil, "Open keymap help")
