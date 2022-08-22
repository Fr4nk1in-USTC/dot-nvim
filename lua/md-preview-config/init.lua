local g = vim.g

g.mkdp_auto_start = 0
g.mkdp_browser = "/usr/bin/surf"
g.mkdp_open_to_the_world = 1
g.mkdp_open_ip = "127.0.0.1"
g.mkdp_port = 8080
g.mkdp_echo_preview_url = 0

-- Mappings
local map = require("mappings").map

map("n", "<leader>mdp", "<cmd>MarkdownPreview<CR>", nil, "Open markdown preview.")
map("n", "<leader>mdt", "<cmd>MarkdownPreviewToggle<CR>", nil, "Toggle markdown preview.")
