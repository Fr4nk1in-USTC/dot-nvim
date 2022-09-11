local status, packer = pcall(require, "packer")
if not status then
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Plenary
    use("nvim-lua/plenary.nvim")

    -- Web Devicons
    use("kyazdani42/nvim-web-devicons")

    -- Theme NightFox
    use("EdenEast/nightfox.nvim")

    -- Auto close brackets
    use("windwp/nvim-autopairs")

    -- use nvim-tree
    use("kyazdani42/nvim-tree.lua")

    -- Statusline
    use("feline-nvim/feline.nvim")

    -- Bufferline
    use("romgrk/barbar.nvim")

    -- LSP Config
    use("neovim/nvim-lspconfig")
    use("nvim-lua/lsp-status.nvim")
    use("hrsh7th/nvim-cmp") -- Autocompletion plugin
    use("hrsh7th/cmp-path") -- Path completion plugin
    use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
    use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
    use("hrsh7th/cmp-omni") -- nvim-cmp source for omnifunc
    use("L3MON4D3/LuaSnip") -- Snippets plugin
    use("onsails/lspkind.nvim")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
    })
    use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
    use("ray-x/lsp_signature.nvim")
    use("SmiteshP/nvim-navic")

    -- Debugger Adapter
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    -- Null-ls
    use("jose-elias-alvarez/null-ls.nvim")

    -- Code Runner
    use("CRAG666/code_runner.nvim")

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("nvim-treesitter/nvim-treesitter-refactor")
    use("p00f/nvim-ts-rainbow")

    -- Color Highlight
    use("norcalli/nvim-colorizer.lua")

    -- Jsonc Support
    use("kevinoid/vim-jsonc") -- json with comment support

    -- Markdown Support
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })
    use("godlygeek/tabular")
    use("preservim/vim-markdown")

    -- Notify
    use("rcarriga/nvim-notify")

    -- Startup
    use("goolord/alpha-nvim")

    -- Github Copilot
    use("github/copilot.vim")

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
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

    -- Image Preview
    use("edluffy/hologram.nvim")
    use("nvim-telescope/telescope-media-files.nvim")
    use("samodostal/image.nvim")

    -- Git
    use("kdheepak/lazygit.nvim")
    use("lewis6991/gitsigns.nvim")
end)
