" Vim Fugitive
" - Vim-based wrapper around Git commands
"   (https://github.com/tpope/vim-fugitive)
Plug 'tpope/vim-fugitive'

nnoremap <leader>gg :Git<CR>
nnoremap <leader>ga :Git add<CR>
nnoremap <leader>gaa :Git add .<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gbl :Telescope git_branches<CR>
nnoremap <leader>gst :Telescope git_status<CR>
