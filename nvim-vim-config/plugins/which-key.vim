" Which Key Nvim
" - A fork of vim-which-key that presents
"   a shortcut helper when <leader> is pressed
Plug 'folke/which-key.nvim'

function WhichKeySetup()
lua << EOF
    wk = require('which-key')

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

    -- Split Keybinds
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

    -- Buffer Keybinds
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

    -- File Write & Quit Keybinds
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
endfunction
