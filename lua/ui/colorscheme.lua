local status, nightfox = pcall(require, "nightfox")
if not status then
    return
end

nightfox.setup({
    options = {
        transparent = true,
    },
})

-- setup must be called before loading
vim.cmd("colorscheme nordfox")
