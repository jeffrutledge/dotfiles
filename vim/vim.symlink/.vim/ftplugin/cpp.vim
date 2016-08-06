set expandtab
set tabstop=2
set shiftwidth=2

"""Highlights characters over 80
highlight ColorColumn ctermbg=DarkGreen
call matchadd('ColorColumn', '\%81v', 100)
"Run Valgrind
:command Vgrind !valgrind --leak-check=full ./%:r
nmap <F6> :Vgrind<CR>
"""""""""""""""""""""
