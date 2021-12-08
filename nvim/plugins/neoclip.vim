" Neoclip
" - A clipboard manager for Vim for people
"   like me who forget that Vim registers
"   exist and frequently lose things because
"   I yank too many lines.
Plug 'AckslD/nvim-neoclip.lua'
Plug 'tami5/sqlite.lua' " Needed for persistence between sessions - brew install sqlite3

nnoremap <leader>vl :Telescope neoclip<CR>

function NeoclipSetup()
lua << EOF
require('neoclip').setup({
    history = 1000,
    enable_persistant_history = true,
    db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
    on_paste = {
        set_reg = true,
    },
    content_spec_column = true,
})

-- This MUST come after the neoclip setup call
require('telescope').load_extension('neoclip')
EOF
endfunction

augroup NeoclipSetup
    autocmd!
    autocmd User PlugLoaded call NeoclipSetup()
augroup END

