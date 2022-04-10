" Vim Test
" - Adds an abstraction layer over testing
"   suites to easily map all testing to
"   the same set of keybinds
Plug 'vim-test/vim-test'

nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tt :TestSuite<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tv :TestVisit<CR>

" Change the PHP testing command to use Artisan
let test#php#phpunit#executable = 'php artisan test'

" Use a Tmux pane to run tests
let test#strategy = 'vimux'
