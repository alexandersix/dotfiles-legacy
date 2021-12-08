" Vim php-cs-fixer
" - Adds Vim keybinds to run php-cs-fixer
"   on a directory or file
Plug 'stephpy/vim-php-cs-fixer'

nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
