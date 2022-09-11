local status, bufferline = pcall(require, "bufferline")
if not status then
    return
end

bufferline.setup({
    -- Enable/disable animations
    animation = true,

    -- Enable/disable auto-hiding the tab bar when there is a single buffer
    auto_hide = false,

    -- Enable/disable current/total tabpages indicator (top right corner)
    tabpages = true,

    -- Enable/disable close button
    closable = true,

    -- Enables/disable clickable tabs
    --  - left-click: go to buffer
    --  - middle-click: delete buffer
    clickable = true,
    -- Configure icons on the bufferline.
    icon_separator_active = "",
    icon_separator_inactive = "",
    icon_close_tab = "",
})

local map = require("helper.mapping").map
-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", nil, "Go to previous buffer")
map("n", "<A-.>", "<Cmd>BufferNext<CR>", nil, "Go to next buffer")
-- Re-order to previous/next
map("n", "<A-[>", "<Cmd>BufferMovePrevious<CR>", nil, "Move current buffer to previous position")
map("n", "<A-]>", "<Cmd>BufferMoveNext<CR>", nil, "Move current buffer to next position")
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", nil, "Go to buffer in position 1")
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", nil, "Go to buffer in position 2")
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", nil, "Go to buffer in position 3")
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", nil, "Go to buffer in position 4")
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", nil, "Go to buffer in position 5")
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", nil, "Go to buffer in position 6")
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", nil, "Go to buffer in position 7")
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", nil, "Go to buffer in position 8")
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", nil, "Go to buffer in position 9")
map("n", "<A-0>", "<Cmd>BufferLast<CR>", nil, "Go to last buffer")
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", nil, "Pin current buffer")
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", nil, "Close current buffer")
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", nil, "Open buffer picker")
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", nil, "Sort buffers by buffer number")
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", nil, "Sort buffers by directory")
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", nil, "Sort buffers by language")
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", nil, "Sort buffers by window number")

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "NvimTree" then
            require("bufferline.state").set_offset(31, "NvimTree")
        end
    end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*",
    callback = function()
        if vim.fn.expand("<afile>"):match("NvimTree") then
            require("bufferline.state").set_offset(0)
        end
    end,
})
