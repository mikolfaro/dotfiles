-- Open file viewer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Open local history
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Move selected code - broken
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep mouse centered
--   when jumping half page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--   when using search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
--   when using simple navigation
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<Up>", "<Up>zz")
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "<Down>", "<Down>zz")

-- Sync with system clipboard - asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y");
vim.keymap.set("v", "<leader>y", "\"+y");
vim.keymap.set("n", "<leader>Y", "\"+Y");
vim.keymap.set("n", "<leader>p", "\"+p");

-- Run HTTP request
vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim");
-- Show curl command of HTTP request
vim.keymap.set("n", "<leader>rc", "<Plug>RestNvimPreview");

-- Disable shortcut near quit
vim.keymap.set("n", "Q", "<nop>");

-- Show diagnostics
local telescope = require("telescope.builtin");
vim.keymap.set("n", "<C-x>d", telescope.diagnostics)

-- Open database
local dbee = require("dbee")
vim.keymap.set("n", "<leader>sql", dbee.open)

-- Useful commands
-- k : Show symbol info popup
-- <Leader>gs : Open git (Fugitive plugin)
-- <Leader>gd : Go to definition
-- <C-o> : Go back to previous position
