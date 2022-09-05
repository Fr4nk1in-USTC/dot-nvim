local status, _ = pcall(require, "lazygit")
if not status then
	return
end

vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true, desc = "Open lazygit" })
