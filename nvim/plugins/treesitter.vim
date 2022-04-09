" Treesitter
" - Vim interface for tree-sitter, a parser
"   generator tool and incremental
"   parsing library
" - Have to :TSInstall the parsers needed
"   for each filetype–see docs for
"   list of installable packages.
"  (https://github.com/nvim-telescope/telescope.nvim#pickers)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/playground'

function TreesitterSetup()
lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}
EOF
endfunction

augroup TreesitterSetup
    autocmd!
    autocmd User PlugLoaded call TreesitterSetup()
augroup END
