" Lualine
" - Adds a more detailed statusline at
"   the bottom of the Vim window
 Plug 'nvim-lualine/lualine.nvim'

function LualineSetup()
lua << EOF
require'lualine'.setup {
    options = {
        theme = 'gruvbox'
    }
}
EOF
endfunction

augroup LualineSetup
    autocmd!
    autocmd User PlugLoaded call LualineSetup()
augroup END
