local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local _ = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'html',
        'jsonls',
        'rust_analyzer',
        'tsserver',
        'sqlls',
        'volar',
    },
    handlers = {
        lsp.default_setup,
    }
})

local lspconfig = require('lspconfig')
local lsp_format = require("lsp-format").on_attach
lspconfig.tsserver.setup({
    root_dir = lspconfig.util.root_pattern("package.json"),
    on_attach = lsp_format })

lspconfig.volar.setup({
    on_attach = lsp_format
})

-- Autoformatter

--[[
 HTML LSP support
 > npm i -g vscode-langservers-extracted

 json LSP support
 > npm i -g vscode-langservers-extracted
]]--

