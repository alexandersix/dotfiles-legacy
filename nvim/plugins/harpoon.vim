" Harpoon
" - Plugin to quickly mark and navigate
"   back and forth to frequently-
"   used files in a project
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/popup.nvim' " Might not be needed if I can get this working with Telescope (see next line)

nnoremap <leader>fm :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>fj :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>fk :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>fl :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>f; :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>fh :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>ft :lua require("harpoon.term").gotoTerminal(1)<CR>
