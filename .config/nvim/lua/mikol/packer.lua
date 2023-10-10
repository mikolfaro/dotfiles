-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Nvin Web Devicons
    use 'nvim-tree/nvim-web-devicons'

    -- Search
    use {
        "nvim-telescope/telescope.nvim", tag = '0.1.2',
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
    }

    -- Syntax highlight
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- Dracula Theme
    use ({ 
        'Mofiqul/dracula.nvim',
        as = 'dracula'
    })

    -- Darcula theme
    use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }

    -- Changes history
    use 'mbbill/undotree'

    -- Git plugin
    use ({ 'tpope/vim-fugitive' })

    -- Git diff tool
    use {'akinsho/git-conflict.nvim', tag = "*", config = function()
      require('git-conflict').setup()
    end}

    -- Status bar
    use ({
        'nvim-lualine/lualine.nvim', 
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })

    -- Autocomplete
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required

            -- Code formatter
            {'lukas-reineke/lsp-format.nvim'}      -- Optional
        }
    }

    -- GitHub Copilot
    use { "zbirenbaum/copilot.lua" }
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
    }

    -- Auto save
    use({
        "Pocco81/auto-save.nvim",
        config = function ()
            require("auto-save").setup {
                -- your config goes here
                -- or just leave it empty :)
            }
        end,
    })
end)
