" Based (heavily) off of erickpatrick's configuration example which
" can be found here: https://gist.github.com/erickpatrick/bc11a2a08ce388d751af5718b839ccd1
if executable('intelephense')
    augroup LspPHPIntelephense
        au!
        au User lsp_setup call lsp#register_server({
            \ 'name': 'intelephense',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
            \ 'whitelist': ['php'],
            \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
            \ 'workspace_config': {
            \   'intelephense': {
            \     'files': {
            \       'maxSize': 1000000,
            \       'associations': ['*.php', '*.phtml'],
            \       'exclude': [],
            \     },
            \     'completion': {
            \       'insertUseDeclaration': v:true,
            \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
            \       'triggerParameterHints': v:true,
            \       'maxItems': 100,
            \     },
            \     'format': {
            \       'enable': v:true
            \     },
            \   },
            \ }
        \})
    augroup END
endif

" Use tab for trigger completion with characters ahead and navigate
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugins before putting this into your config
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <C-space> to trigger completion
inoremap <silent><expr> <C-space> coc#refresh()

" Use <CR> to confirm completion
" CoC only does snippet and additional edit on confirm
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

""" 'c' is the key sequence starter for CoC completion keybinds

" Navigate Diagnostics
nmap <silent> c[ <Plug>(coc-diagnostic-prev)
nmap <silent> c] <Plug>(coc-diagnostic-next)

" GoTo Code Navigation
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>ct <Plug>(coc-type-definition)
nmap <leader>ci <Plug>(coc-implementation)
nmap <leader>cr <Plug>(coc-references)
nmap <leader>cb <C-O><CR>

" Show Documentation in Preview Window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight Symbol & Its References
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol Rename
nmap <leader>crn <Plug>(coc-rename)

" Format Selected Code
xmap <leader>cfo <Plug>(coc-format-selected)
nmap <leader>cfo <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Select formatexpr specified filetype(s)
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>caa  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>cfi  <Plug>(coc-fix-current)

" Add :Format command to format the current buffer
command! -nargs=0 Format :call CocAction('format')

" Add :Fold command to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add :Organize command to organize inputs of current buffer
command! -nargs=0 Organize :call CocAction('runCommand', 'editor.action.organizeImport')

" Add support for Neovim's native statusline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Add mappings for CocList
" Show all diagnostics
nnoremap <leader>cll :<C-u>CocList diagnostics<CR>

" Manage extensions
nnoremap <leader>cle :<C-u>CocList extensions<CR>

" Show commands
nnoremap <leader>clc :<C-u>CocList commands<CR>

" Find symbol in current document with Outline
nnoremap <leader>clo :<C-u>CocList outline<CR>

" Search workplace symbols
nnoremap <leader>cls :<C-u>CocList -I symbols<CR>

" Do default action for next and previous items
nnoremap <leader>clj :<C-u>CocNext<CR>
nnoremap <leader>clk :<C-u>CocPrev<CR>

" Resume latest coc list
nnoremap <leader>clr :<C-u>CocListResume<CR>
