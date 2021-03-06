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
    use { "doums/darcula" }

    -- Changes history
    use 'mbbill/undotree'

    -- Toggle comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Rest API Client
    use {
        "rest-nvim/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }

    -- Git plugin
    use ({ 'tpope/vim-fugitive' })

    -- Git diff tool
    use "sindrets/diffview.nvim"

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
        -- config = function ()
        --   require("copilot_cmp").setup()
        -- end
    }

    -- Database
    use {
      "kndndrj/nvim-dbee",
      requires = {
        "MunifTanjim/nui.nvim",
      },
      run = function()
        -- Install tries to automatically detect the install method.
        -- if it fails, try calling it with one of these parameters:
        --    "curl", "wget", "bitsadmin", "go"
        require("dbee").install()
      end,
      config = function()
        require("dbee").setup(--[[optional config]])
      end
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
