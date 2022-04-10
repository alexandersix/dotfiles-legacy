" Ultisnips
" - Snippet manager for Vim that allows
"   you to define reusable blocks of text
"   that will get expanded in a few keystrokes
Plug 'sirver/UltiSnips'
Plug 'fhill2/telescope-ultisnips.nvim'

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsEditSplit='vertical'

nnoremap <leader><tab> :Telescope ultisnips <CR>

function UltiSnipsSetup()
lua << EOF
local telescope = require('telescope');
telescope.setup {
    pickers = {
        find_files = {
            hidden = true
        }
    },
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden"
        },
        file_ignore_patterns = {
            "node_modules",
            ".work/.*",
            ".cache/.*",
            ".idea/.*",
            "dist/.*",
            ".git/.*",
            "public/vendor"
        },
    }
}

telescope.load_extension('ultisnips');
EOF
endfunction

augroup UltiSnipsSetup
    autocmd!
    autocmd User PlugLoaded call UltiSnipsSetup()
augroup END

