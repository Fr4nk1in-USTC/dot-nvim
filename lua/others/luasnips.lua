local status, luasnip = pcall(require, "luasnip")
if not status then
    return
end

local types = require("luasnip.util.types")
luasnip.config.setup({
    update_events = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<- Choice Here (Prev: <C-,>, Next: <C-.>)", "SpecialComment" } },
            },
        },
    },
    store_selection_keys = "<Tab>",
})

require("luasnip.loaders.from_lua").lazy_load()

local map = require("helper.mapping").map

-- set keybinds for both INSERT and VISUAL.
map("i", "<C-.>", "<Plug>luasnip-next-choice", {}, "Select next choiceNode.")
map("s", "<C-.>", "<Plug>luasnip-next-choice", {}, "Select next choiceNode.")
map("i", "<C-,>", "<Plug>luasnip-prev-choice", {}, "Select previous choiceNode.")
map("s", "<C-,>", "<Plug>luasnip-prev-choice", {}, "Select previous choiceNode.")
