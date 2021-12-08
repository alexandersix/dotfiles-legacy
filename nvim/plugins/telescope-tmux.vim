" Telescope Tmux
" - Integration to work with Tmux via
"   the Telescope window manager
" - NOTE: This only works when Vim is
"   in a Tmux context
Plug 'camgraff/telescope-tmux.nvim'

nnoremap <leader>ww :Telescope tmux windows<CR>
nnoremap <leader>sl :Telescope tmux sessions<CR>
