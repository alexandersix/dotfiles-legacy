" cmp-tabnine
" - Adds Tabnine AI completion to nvim-cmp
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

function TabnineSetup()
lua << EOF
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
    max_lines = 1000;
    max_num_results = 20;
    sort = true;
    run_on_every_keystroke = true;
    snippet_placeholder = '..';
    ignored_file_types = {
    };
})
EOF
endfunction

augroup TabnineSetup
    autocmd!
    autocmd User PlugLoaded call TabnineSetup()
augroup END
