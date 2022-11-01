local status, zen = pcall(require, "zen-mode")
if not status then
    return
end

zen.setup({
    window = {
        backdrop = 0.2,
    },
})
