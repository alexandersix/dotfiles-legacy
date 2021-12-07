call plug#begin('~/.vim/plugged')

" Nord colorscheme
" Plug 'arcticicestudio/nord-vim'
Plug 'shaunsingh/nord.nvim'

" Dracula colorscheme
" Plug 'dracula/vim', { 'as': 'dracula' }

" Gruvbox colorscheme
Plug 'morhetz/gruvbox'

" Night Owl colorscheme
" Plug 'haishanh/night-owl.vim'

" Vim Fugitive
" - Vim-based wrapper around Git commands
"   (https://github.com/tpope/vim-fugitive)
Plug 'tpope/vim-fugitive'

" Telescope
" - Extendable fuzzy-finder over lists, i.e.
"   files, commands, buffers, etc.
" - Needs ripgrep and other packatges
"   installed on system to work,
"   see docs for details
"   (https://github.com/nvim-telescope/telescope.nvim)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Treesitter
" - Vim interface for tree-sitter, a parser
"   generator tool and incremental
"   parsing library
" - Have to :TSInstall the parsers needed
"   for each filetype–see docs for
"   list of installable packages.
"  (https://github.com/nvim-telescope/telescope.nvim#pickers)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Vim Commentary
" - Bulk commenting.
Plug 'tpope/vim-commentary'

" Harpoon
" - Plugin to quickly mark and navigate
"   back and forth to frequently-
"   used files in a project
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/popup.nvim' " Might not be needed if I can get this working with Telescope (see next line)
" Plug 'brandoncc/telescope-harpoon.nvim' " - not working

" Lualine
" - Adds a more detailed statusline at
"   the bottom of the Vim window
 Plug 'nvim-lualine/lualine.nvim'

" Vim Gitgutter
" - Shows a git diff in the sign column
" - Currently disabled because it was making Vim lag BADLY
Plug 'airblade/vim-gitgutter'

" Which Key Nvim
" - A fork of vim-which-key that presents
"   a shortcut helper when <leader> is pressed
Plug 'folke/which-key.nvim'

" Vim php-cs-fixer
" - Adds Vim keybinds to run php-cs-fixer
"   on a directory or file
Plug 'stephpy/vim-php-cs-fixer'

" Vim Test
" - Adds an abstraction layer over testing
"   suites to easily map all testing to
"   the same set of keybinds
Plug 'vim-test/vim-test'

" Vimux
" - Allows Vim to interact with Tmux
"   by opening Tmux panes for Vim functionality
"   (ex: opening a pane to run testing suite)
Plug 'preservim/vimux'

" Ultisnips
" - Snippet manager for Vim that allows
"   you to define reusable blocks of text
"   that will get expanded in a few keystrokes
Plug 'sirver/UltiSnips'
Plug 'fhill2/telescope-ultisnips.nvim'

" Octo
" - Github issue and PR manager baked
"   directly into Vim (using Telescope
"   as the window manager)
Plug 'pwntester/octo.nvim'
Plug 'kyazdani42/nvim-web-devicons' " Required

" Vim Startify
" - Start screen for Vim
" Plug 'mhinz/vim-startify'

" Vim Dashboard
" - Minimal start screen for Neovim
Plug 'glepnir/dashboard-nvim'

" Neoclip
" - A clipboard manager for Vim for people
"   like me who forget that Vim registers
"   exist and frequently lose things because
"   I yank too many lines.
Plug 'AckslD/nvim-neoclip.lua'
Plug 'tami5/sqlite.lua' " Needed for persistence between sessions - brew install sqlite3

" Telescope Tmux
" - Integration to work with Tmux via
"   the Telescope window manager
" - NOTE: This only works when Vim is
"   in a Tmux context
Plug 'camgraff/telescope-tmux.nvim'

" Vim Prettier
" - Prettier plugin that works inside of Vim
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Vim Closetag
" - Closes HTML tags automatically
Plug 'alvan/vim-closetag'

" Nvim Lspconfig
" - Configures the built-in Nvim LSP
" Plug 'neovim/nvim-lspconfig'

" Nvim Compe
" - Completion engine written in Lua
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/nvim-cmp'
" For Ultisnips integration:
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" LSP Signature
" - Adds a window to show signatures for LSP
" Plug 'ray-x/lsp_signature.nvim'

" LSP Saga
" - Lightweight plugin for LSP enhancement
" Plug 'glepnir/lspsaga.nvim'

" LSP Kind
" - Adds icons to the built-in LSP
" Plug 'onsails/lspkind-nvim'

" Vim Gutentags
" - Automatic handling of CTAGS files
" Plug 'ludovicchabant/vim-gutentags'

" CoC (Conquer of Completion)
" - Support for incremental completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Auto Pairs
" - Automatically closes brackets, braces,
"   quotes, parentheses, etc.
Plug 'jiangmiao/auto-pairs'

" NERD Tree
" - Adds a project sidebar to view hierarchy of files
Plug 'preservim/nerdtree'

" Sayonara
" - A more sane way to close windows
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

" Surround
" - Surrounds things with other things
Plug 'tpope/vim-surround'

" Heritage
" - Lets you do the following: `:e some/path/that/doesnt/exist.md`
Plug 'jessarcher/vim-heritage'

" Editorconfig
" - Allows use of the .editorconfig standard in the Vim editor
Plug 'editorconfig/editorconfig-vim'

" Pasta
" - More intelligent pasting
Plug 'sickill/vim-pasta'

" Markdown Preview
" - Previews markdown files.
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" TODO: Add Projectionist for quick swapping between feature and test files
" (see JessArcher's config for details)

" Visual Star Search
" - Allows you to use visual mode with Vim's default * functionality
Plug 'nelstrom/vim-visual-star-search'

call plug#end()

syntax enable

let g:nord_italic = v:true
let g:nord_italic_comments = v:true
let g:nord_underline = v:true
let g:nord_cursor_line_number_background = v:true

let g:gruvbox_bold = v:true
let g:gruvbox_italic = v:true
let g:gruvbox_transparent_bg = v:true
let g:gruvbox_underline = v:true

colorscheme gruvbox

let mapleader = " "

lua << EOF
    wk = require('which-key')
EOF

""" Vim Fixes (https://www.youtube.com/watch?v=hSHATqh8svM)
" Fix Y
nnoremap Y y$

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap > ><c-g>u
inoremap < <<c-g>u

" Jumplist Mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-j> <esc>:m .+1<CR>==
nnoremap <C-k> <esc>:m .-2<CR>==

""" Split Management
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wh <C-W><C-H>
nnoremap <leader>wv :vsp<CR>
nnoremap <leader>wn :sp<CR>

nnoremap <leader>wq :qall<CR>
nnoremap <leader>wo <C-W>o

nnoremap <leader>wrl :vertical resize +5<CR>
nnoremap <leader>wrh :vertical resize -5<CR>
nnoremap <leader>wrj :resize +5<CR>
nnoremap <leader>wrk :resize -5<CR>
nnoremap <leader>wr= <C-W>=

" Split keymapping
lua << EOF
    wk.register({
        w = {
            name = "window",
            h = "Move left",
            j = "Move down",
            k = "Move up",
            l = "Move right",
            v = "Split right",
            n = "Split down",
            d = "Quit window",
            q = "Quit all",
            o = "Quit all except selected",
        }
    }, {
        mode = "n",
        prefix = "<leader>",
        silent = true,
        noremap = true,
        nowait = false
    })
EOF

""" Buffers
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bj <C-^>
nnoremap <leader>bl :Telescope buffers<CR>

" Buffers keymapping
lua << EOF
    wk.register({
        b = {
            name = "buffer",
            p = "Prev buffer",
            n = "Next buffer",
            j = "Jump to last",
            l = "List buffers",
        }
    }, {
        mode = "n",
        prefix = "<leader>",
        silent = true,
        noremap = true,
        nowait = false
    })
EOF

""" File Write & Quit
nnoremap <leader>fs :w<CR>
nnoremap <leader>fwq :wq<CR>
nnoremap <leader>fqq :q!<CR>

" File Write & Quit keymapping
lua << EOF
    wk.register({
        f = {
            name = "File Write & Read",
            s = "Save file",
            wq = "Save and quit",
            qq = "Quit without saving",
        }
    }, {
        mode = "n",
        prefix = "<leader>",
        silent = true,
        noremap = true,
        nowait = false
    })
EOF

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup ALEXANDER_GROUP
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

""" Plugin Keybinds

"" Vim Fugitive / Git commands
nnoremap <leader>gg :Git<CR>
nnoremap <leader>ga :Git add<CR>
nnoremap <leader>gaa :Git add .<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
"nnoremap <leader>gbc :Git branch
nnoremap <leader>gbl :Telescope git_branches<CR>
nnoremap <leader>gst :Telescope git_status<CR>

"" Telescope
nnoremap <leader><leader> :Telescope find_files<CR>
nnoremap <leader>. :Telescope live_grep<CR>
nnoremap <leader>, :Telescope file_browser<CR>
nnoremap <leader>ff :Telescope oldfiles<CR>
nnoremap <leader>f. :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>?k :Telescope keymaps<CR>
nnoremap <leader>ml :Telescope marks<CR>
" nnoremap <leader>sc :Telescope spell_suggest<CR>
" buffers command relocated to buffers section of this file
" git_branches command relocated to git section of this file

"" Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
    },
    indent = {
        enable = true,
    },
}
EOF

"" Vim Commentary
" No keybinds, but gcc takes out a line
" and gc in Visual mode takes out
" everything that is selected.

"" Harpoon
nnoremap <leader>hm :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hj :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>hk :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>hl :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>h; :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>hh :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>ht :lua require("harpoon.term").gotoTerminal(1)<CR>

"" Lualine
lua << EOF
require'lualine'.setup {
    options = {
        theme = 'gruvbox'
    }
}
EOF

" Which Key Nvim
lua << EOF
    wk.register({
        f = {
            name = "file",
            f = "Recent Files"
        }
    }, {
        mode = "n",
        prefix = "<leader>",
        silent = true,
        noremap = true,
        nowait = false
    })
EOF

"" Vim php-cs-fixer
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

" Fix on save
" autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

"" Vim Test
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tt :TestSuite<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tv :TestVisit<CR>

" Change the PHP testing command to use Artisan
let test#php#phpunit#executable = 'php artisan test'

" Use a Tmux pane to run tests
let test#strategy = 'vimux'

"" Vimux
let g:VimuxOrientation = 'h'
let g:VimuxCloseOnExit = 1

"" Ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsEditSplit='vertical'

" Telescope integration
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
            ".git/.*"
        },
    }
}

telescope.load_extension('ultisnips');
EOF

nnoremap <leader><tab> :Telescope ultisnips <CR>

"" Octo
nnoremap <leader>ghpl :Octo pr list <CR>
nnoremap <leader>ghil :Octo issue list <CR>

"" Vim Dashboard
let g:dashboard_default_executive = "telescope"

" Setup
lua << EOF
require('octo').setup{}
EOF

"" Neoclip
nnoremap <leader>vl :Telescope neoclip<CR>
nnoremap <leader>pp :Telescope neoclip<CR>

" Setup
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

"" Telescope Tmux
nnoremap <leader>ww :Telescope tmux windows<CR>
nnoremap <leader>sl :Telescope tmux sessions<CR>

"" Vim Prettier
nnoremap <leader>pp :PrettierAsync<CR>

"" Keymap
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>

"" NERD Tree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeWinPos = "right"

nnoremap <leader>op :NERDTreeToggle<CR>

"" Sayonara
nnoremap <leader>wd :Sayonara<CR>

"" Surround
" Change surroundings: cs{old}{new}
" Remove surroundings: ds{surrounding}
" Add surroundings to word: ysiw{surrounding}
" Add surroundings to line: yss{surrounding}
" Add surroundings in visual: S{surrounding}

"" Heritage
" This lets you select and open a new file/filepath within vim
map gf :edit <cfile><CR>

"" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"" Pasta
let g:pasta_disabled_filetypes = ['fugitive']
