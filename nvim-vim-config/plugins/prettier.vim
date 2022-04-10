" Vim Prettier
" - Prettier plugin that works inside of Vim
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

nnoremap <leader>pp :PrettierAsync<CR>
