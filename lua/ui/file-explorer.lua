local status, tree = pcall(require, "nvim-tree")
if not status then
    return
end

tree.setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = { {
                key = "u",
                action = "dir_up",
            } },
        },
    },
    git = {
        enable = true,
        ignore = false,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    diagnostics = {
        enable = true,
    },
})

local map = require("helper.mapping").map
map("n", "<leader>nt", ":NvimTreeToggle<CR>", nil, "Toggle NvimTree")
