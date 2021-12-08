"    _____ _____  __
"   / ___//  _/ |/ /    Alex Six
"   \__ \ / / |   /     https://github.com/alexandersix
"  ___/ // / /   |      alexanderhsix (at) gmail (dot) com
" /____/___//_/|_|
"
" My personal Neovim configuration with inspiration taken
" from jessarcher <https://github.com/jessarcher/dotfiles/blob/master/nvim/init.vim>
"

"---------------------------------------------------------
" General Settings
"---------------------------------------------------------

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap

set smartcase
set ignorecase

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set incsearch
set termguicolors
set cursorline
set scrolloff=8
set noshowmode
set completeopt=menuone,noselect

set wildmode=longest:full,full

set signcolumn=yes
set colorcolumn=80

set splitbelow
set splitright

set clipboard=unnamedplus

let mapleader = " "

"---------------------------------------------------------
" Keybinds
"--------------------------------------------------------

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

" Split Management
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

" Buffers
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bj <C-^>
nnoremap <leader>bl :Telescope buffers<CR>

" File Write & Quit
nnoremap <leader>fs :w<CR>
nnoremap <leader>fwq :wq<CR>
nnoremap <leader>fqq :q!<CR>

"---------------------------------------------------------
" Plugins
"--------------------------------------------------------

call plug#begin('~/.vim/plugged')

source ~/.config/nvim/plugins/auto-pairs.vim
source ~/.config/nvim/plugins/closetag.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/dashboard.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/gitgutter.vim
source ~/.config/nvim/plugins/gruvbox.vim
source ~/.config/nvim/plugins/harpoon.vim
source ~/.config/nvim/plugins/heritage.vim
source ~/.config/nvim/plugins/lualine.vim
source ~/.config/nvim/plugins/markdown-preview.vim
source ~/.config/nvim/plugins/neoclip.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/nord.vim
source ~/.config/nvim/plugins/octo.vim
source ~/.config/nvim/plugins/pasta.vim
source ~/.config/nvim/plugins/php-cs-fixer.vim
source ~/.config/nvim/plugins/plenary.vim
source ~/.config/nvim/plugins/prettier.vim
source ~/.config/nvim/plugins/projectionist.vim
source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/telescope-tmux.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/ultisnips.vim
source ~/.config/nvim/plugins/vim-test.vim
source ~/.config/nvim/plugins/vimux.vim
source ~/.config/nvim/plugins/visual-star-search.vim
source ~/.config/nvim/plugins/which-key.vim

call plug#end()
doautocmd User PlugLoaded " Necessary for plugins to setup correctly

syntax enable
colorscheme gruvbox

"---------------------------------------------------------
" General Functions
"--------------------------------------------------------

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup ALEXANDER_GROUP
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

"" Keymap
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
"


