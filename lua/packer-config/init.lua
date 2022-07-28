return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Web Devicons
	use("kyazdani42/nvim-web-devicons")

	-- Theme NightFox
	use("EdenEast/nightfox.nvim")

	-- Auto close brackets
	use("windwp/nvim-autopairs")

	-- Plugin nvim-tree
	use("kyazdani42/nvim-tree.lua")

	-- Statusline
	use("glepnir/galaxyline.nvim")

	-- Bufferline
	use("romgrk/barbar.nvim")

	-- LSP Config
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("onsails/lspkind.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("WhoIsSethDaniel/mason-tool-installer.nvim")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
	use("ray-x/lsp_signature.nvim")
	-- Null-ls
	use("jose-elias-alvarez/null-ls.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("p00f/nvim-ts-rainbow")

	-- Jsonc Support
	use("kevinoid/vim-jsonc") -- json with comment support

	-- Notify
	use("rcarriga/nvim-notify")

	-- Github Copilot
	use("github/copilot.vim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
	})

	-- Comment
	use("numToStr/Comment.nvim")

	-- Shade
	use("sunjon/shade.nvim")

	-- Git
	use("kdheepak/lazygit.nvim")
	use("lewis6991/gitsigns.nvim")
end)
