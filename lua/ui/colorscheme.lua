local status, _ = pcall(require, "nightfox")
if not status then
	return
end

-- setup must be called before loading
vim.cmd("colorscheme nordfox")
