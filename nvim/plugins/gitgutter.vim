" Vim Gitgutter
" - Shows a git diff in the sign column
Plug 'airblade/vim-gitgutter'

function GitgutterSetup()
endfunction

augroup GitgutterSetup
    autocmd!
    autocmd User PlugLoaded call GitgutterSetup()
augroup END
