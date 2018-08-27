set expandtab
set tabstop=2
set shiftwidth=2

"Run Valgrind
:command! Vgrind !valgrind --leak-check=full ./%:r
nmap <F6> :Vgrind<CR>
"""""""""""""""""""""
