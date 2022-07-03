local M = {}

local utils = require "core.utils"

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
map("n", "<leader>wh", "<cmd>lua require'smart-splits'.move_cursor_left()<cr>", opts)
map("n", "<leader>wj", "<cmd>lua require'smart-splits'.move_cursor_down()<cr>", opts)
map("n", "<leader>wk", "<cmd>lua require'smart-splits'.move_cursor_up()<cr>", opts)
map("n", "<leader>wl", "<cmd>lua require'smart-splits'.move_cursor_right()<cr>", opts)
map("n", "<C-h>", "<cmd>lua require'smart-splits'.move_cursor_left()<cr>", opts)
map("n", "<C-j>", "<cmd>lua require'smart-splits'.move_cursor_down()<cr>", opts)
map("n", "<C-k>", "<cmd>lua require'smart-splits'.move_cursor_up()<cr>", opts)
map("n", "<C-l>", "<cmd>lua require'smart-splits'.move_cursor_right()<cr>", opts)

map("n", "<leader>wv", ":vsp<cr>", opts)
map("n", "<leader>wn", ":sp<cr>", opts)

map("n", "<leader>wq", ":qall", opts)
map("n", "<leader>wo", "<C-W>o", opts)

-- Resize with arrows
map("n", "<leader>wrk", "<cmd>lua require'smart-splits'.resize_up(5)<cr>", opts)
map("n", "<leader>wrj", "<cmd>lua require'smart-splits'.resize_down(5)<cr>", opts)
map("n", "<leader>wrh", "<cmd>lua require'smart-splits'.resize_left(5)<cr>", opts)
map("n", "<leader>wrl", "<cmd>lua require'smart-splits'.resize_right(5)<cr>", opts)
map("n", "<leader>wr=", "<C-w>=", opts)

-- Navigate buffers
if utils.is_available "bufferline.nvim" then
  map("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", opts)
  map("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", opts)
  map("n", "}", "<cmd>BufferLineMoveNext<cr>", opts)
  map("n", "{", "<cmd>BufferLineMovePrev<cr>", opts)
else
  map("n", "<leader>bn", "<cmd>bnext<CR>", opts)
  map("n", "<leader>bp", "<cmd>bprevious<CR>", opts)
end

map("n", "<leader>bj", "<C-^>", opts)

-- Move text up and down
map("n", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
map("n", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)

-- Standard Operations
map("n", "<leader>fs", "<cmd>w<CR>", opts)
map("n", "<leader>fwq", "<cmd>wq<CR>", opts)
map("n", "<leader>fqq", "<cmd>q<CR>", opts)
-- map("n", "<leader>c", "<cmd>Bdelete!<CR>", opts)
-- map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Packer
map("n", "<leader>pc", "<cmd>PackerCompile<cr>", opts)
map("n", "<leader>pi", "<cmd>PackerInstall<cr>", opts)
map("n", "<leader>ps", "<cmd>PackerSync<cr>", opts)
map("n", "<leader>pS", "<cmd>PackerStatus<cr>", opts)
map("n", "<leader>pu", "<cmd>PackerUpdate<cr>", opts)

-- LSP
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", opts)
map("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
map("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)

-- NeoTree
if utils.is_available "neo-tree.nvim" then
  map("n", "<leader>e", "<cmd>Neotree toggle position=right<CR>", opts)
  map("n", "<leader>o", "<cmd>Neotree focus<CR>", opts)
end

-- Dashboard
if utils.is_available "dashboard-nvim" then
  map("n", "<leader>d", "<cmd>Dashboard<CR>", opts)
  map("n", "<leader>fn", "<cmd>DashboardNewFile<CR>", opts)
  map("n", "<leader>db", "<cmd>Dashboard<CR>", opts)
  map("n", "<leader>bm", "<cmd>DashboardJumpMarks<CR>", opts)
  map("n", "<leader>sl", "<cmd>SessionLoad<CR>", opts)
  map("n", "<leader>ss", "<cmd>SessionSave<CR>", opts)
end

-- GitSigns
if utils.is_available "gitsigns.nvim" then
  map("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", opts)
  map("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", opts)
  map("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", opts)
  map("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", opts)
  map("n", "<leader>gh", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", opts)
  map("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", opts)
  map("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", opts)
  map("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", opts)
  map("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", opts)
end

-- Telescope
map("n", "<leader>.", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", opts)
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", opts)
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
map("n", "<leader><leader>", "<cmd>Telescope find_files hidden=true<CR>", opts)
map("n", "<leader>bl", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)
map("n", "<leader>sb", "<cmd>Telescope git_branches<CR>", opts)
map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>sm", "<cmd>Telescope man_pages<CR>", opts)
map("n", "<leader>sn", "<cmd>Telescope notify<CR>", opts)
map("n", "<leader>sr", "<cmd>Telescope registers<CR>", opts)
map("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", opts)
map("n", "<leader>sc", "<cmd>Telescope commands<CR>", opts)
map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", opts)
map("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", opts)
map("n", "<leader>lD", "<cmd>Telescope diagnostics<CR>", opts)

-- LSP
map("n", "<leader>cD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "<leader>ci", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "<leader>go", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
map("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
map("n", "<leader>dk", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", opts)
map("n", "<leader>dj", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>crn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

-- Comment
if utils.is_available "Comment.nvim" then
  map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>", opts)
  map("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)
end

-- ForceWrite
map("n", "<C-s>", "<cmd>w!<CR>", opts)

-- ForceQuit
map("n", "<C-q>", "<cmd>q!<CR>", opts)

-- Terminal
if utils.is_available "nvim-toggleterm.lua" then
  map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", opts)
  map("n", "<leader>tj", "<cmd>lua require('core.utils').toggle_term_cmd('node')<CR>", opts)
  map("n", "<leader>tp", "<cmd>lua require('core.utils').toggle_term_cmd('python')<CR>", opts)
  map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", opts)
  map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", opts)
  map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", opts)
end

-- SymbolsOutline
if utils.is_available "symbols-outline.nvim" then
  map("n", "<leader>lS", "<cmd>SymbolsOutline<CR>", opts)
end

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<A-j>", "<cmd>m .+1<CR>==", opts)
map("v", "<A-k>", "<cmd>m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
map("x", "J", "<cmd>move '>+1<CR>gv-gv", opts)
map("x", "K", "<cmd>move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", "<cmd>move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", "<cmd>move '<-2<CR>gv-gv", opts)

-- disable Ex mode:
map("n", "Q", "<Nop>", opts)

-- Fix Y
map("n", "Y", "y$", opts)

-- Keeping it centered
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)

-- Undo breakpoints
map("i", ",", ",<C-g>u", opts)
map("i", ".", ".<C-g>u", opts)
map("i", "!", "!<C-g>u", opts)
map("i", "?", "?<C-g>u", opts)
map("i", ">", "><C-g>u", opts)
map("i", "<", "<<C-g>u", opts)

-- Harpoon
map("n", "<leader>fm", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
map("n", "<leader>fj", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", opts)
map("n", "<leader>fk", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", opts)
map("n", "<leader>fl", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts)
map("n", "<leader>f;", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", opts)
map("n", "<leader>fh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)

-- Fugitive
map("n", "<leader>gg", "<cmd>Git<cr>", opts)
map("n", "<leader>ga", "<cmd>Git add<cr>", opts)
map("n", "<leader>gc", "<cmd>Git commit<cr>", opts)
map("n", "<leader>gp", "<cmd>Git push<cr>", opts)
map("n", "<leader>gb", "<cmd>Git blame<cr>", opts)

-- php-cs-fixer
map("n", "<leader>pcd", "<cmd>call PhpCsFixerFixDirectory()<cr>", opts)
map("n", "<leader>pcf", "<cmd>call PhpCsFixerFixFile()<cr>", opts)

-- Prettier
map("n", "<leader>pp", "<cmd>PrettierAsync<cr>", opts)

-- Sayonara
map("n", "<leader>wd", "<cmd>Sayonara<cr>", opts)

-- Trouble
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)

-- Maximizer
map("n", "<leader>zz", "<cmd>MaximizerToggle<cr>", opts)

-- Vim-Test
map("n", "<leader>tn", "<cmd>TestNearest<cr>", opts)
map("n", "<leader>tf", "<cmd>TestFile<cr>", opts)
map("n", "<leader>ts", "<cmd>TestSuite<cr>", opts)
map("n", "<leader>tv", "<cmd>TestVisit<cr>", opts)

vim.cmd("let test#php#phpunit#executable = 'php artisan test'")
vim.cmd("let test#strategy = 'vimux'")

-- Vimux
vim.cmd("let g:VimuxOrientation = 'h'")
vim.cmd("let g:VimuxCloseOnExit = 1")

-- Luasnip
map("i", "<C-k>", "<cmd>lua require'luasnip'.expand_or_jump()<cr>", opts)
map("i", "<C-j>", "<cmd>lua require'luasnip'.jump(-1)<cr>", opts)

-- Glow (Markdown viewer)
map("n", "<leader>mm", "<cmd>Glow %<cr>", opts)

function _G.set_terminal_keymaps()
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd [[
  augroup TermMappings
    autocmd! TermOpen term://* lua set_terminal_keymaps()
  augroup END
]]

return M
