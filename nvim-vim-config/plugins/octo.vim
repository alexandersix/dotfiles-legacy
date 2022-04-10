" Octo
" - Github issue and PR manager baked
"   directly into Vim (using Telescope
"   as the window manager)
Plug 'pwntester/octo.nvim'
Plug 'kyazdani42/nvim-web-devicons' " Required

nnoremap <leader>ghpl :Octo pr list <CR>
nnoremap <leader>ghil :Octo issue list <CR>

function OctoSetup()
lua << EOF
require('octo').setup{}
EOF
endfunction

augroup OctoSetup
    autocmd!
    autocmd User PlugLoaded call OctoSetup()
augroup END
