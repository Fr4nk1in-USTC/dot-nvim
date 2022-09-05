local g = vim.g
local map = require("helper.mapping").map

-- markdown-preview.nvim
g.mkdp_auto_start = 0
g.mkdp_browser = "/usr/bin/surf"
g.mkdp_open_to_the_world = 1
g.mkdp_open_ip = "127.0.0.1"
g.mkdp_port = 8080
g.mkdp_echo_preview_url = 0

map("n", "<leader>mdp", "<cmd>MarkdownPreview<CR>", nil, "Open markdown preview.")
map("n", "<leader>mdt", "<cmd>MarkdownPreviewToggle<CR>", nil, "Toggle markdown preview.")

-- vim-markdown
g.vim_markdown_folding_disabled = 1
g.vim_markdown_folding_level = 2
g.vim_markdown_toc_autofit = 1
g.vim_markdown_conceal_code_blocks = 0
g.vim_markdown_follow_anchor = 1
g.vim_markdown_math = 1
g.vim_markdown_frontmatter = 1
