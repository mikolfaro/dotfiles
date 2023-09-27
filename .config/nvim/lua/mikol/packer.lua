-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Search
    use {
        "nvim-telescope/telescope.nvim", tag = '0.1.2',
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
    }

    -- Syntax highlight
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- Theme
    use ({ 
        'Mofiqul/dracula.nvim',
        as = 'dracula',
        config = function ()
            vim.cmd('colorscheme dracula')
        end
    })

    -- Changes history
    use 'mbbill/undotree'

    -- Git plugin
    use ({ 'tpope/vim-fugitive' })

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
        }
    }

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
