" Telescope
" - Extendable fuzzy-finder over lists, i.e.
"   files, commands, buffers, etc.
" - Needs ripgrep and other packatges
"   installed on system to work,
"   see docs for details
"   (https://github.com/nvim-telescope/telescope.nvim)
Plug 'nvim-telescope/telescope.nvim'

nnoremap <leader><leader> :Telescope find_files<CR>
nnoremap <leader>. :Telescope live_grep<CR>
nnoremap <leader>, :Telescope file_browser<CR>
nnoremap <leader>ff :Telescope oldfiles<CR>
nnoremap <leader>f. :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>/ :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>?k :Telescope keymaps<CR>
nnoremap <leader>ml :Telescope marks<CR>
" nnoremap <leader>sc :Telescope spell_suggest<CR>
" buffers command relocated to buffers section of init.vim
" git_branches command relocated to git section of init.vim


