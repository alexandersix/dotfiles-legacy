" Harpoon
" - Plugin to quickly mark and navigate
"   back and forth to frequently-
"   used files in a project
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/popup.nvim' " Might not be needed if I can get this working with Telescope (see next line)

nnoremap <leader>hm :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hj :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>hk :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>hl :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>h; :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>hh :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>ht :lua require("harpoon.term").gotoTerminal(1)<CR>
