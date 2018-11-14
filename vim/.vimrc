call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py  --clang-completer --system-libclang' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'altercation/vim-colors-solarized'
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rhysd/vim-clang-format'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

call plug#end()

""""""""""Plugin Settings""""""""""
"""solarized syntax enable
set background=dark
silent! colorscheme solarized

"""YCM
"c++ completion (default compile settings)
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" Don't ask about config files
let g:ycm_confirm_extra_conf = 0
"let g:ycm_warning_symbol = '->'
highlight YcmWarningSign guifg=DodgerBlue1
"Mappings
nnoremap <leader>jj :YcmCompleter GoTo<CR>
nnoremap <leader>ji :YcmCompleter GoToInclude<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jD :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>

"Misc
let g:ycm_auto_trigger = 1
let g:ycm_python_binary_path = '/usr/bin/python'
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
let g:ycm_filetype_blacklist = {
			\ 'tagbar' : 1,
			\ 'qf' : 1,
			\ 'notes' : 1,
			\ 'unite' : 1,
			\ 'text' : 1,
			\ 'pandoc' : 1,
			\ 'infolog' : 1,
			\ 'mail' : 1
			\}
"""ctrlp
let g:ctrlp_open_multiple_files = '2h'
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_map = '<leader>f'
nmap <leader>b :CtrlPBuffer<CR>
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"""Auto Format
" ClangFormat
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>af :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>af :ClangFormat<CR>
" Lint Auto Format
autocmd FileType python nnoremap <buffer><Leader>af :PymodeLintAuto<CR>
autocmd FileType python vnoremap <buffer><Leader>af :PymodeLintAuto<CR>

"""airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent-file' ]

"""easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
map <space>f <Plug>(easymotion-bd-f)
map <space>w <Plug>(easymotion-bd-w)
map <space>e <Plug>(easymotion-bd-e)
map <space>l <Plug>(easymotion-bd-jk)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" let g:EasyMotion_disable_two_key_combo = 0
""" vimwiki
let g:vimwiki_map_prefix = '<Leader>vw'
let g:vimwiki_list = [{'path': '~/safe/vimwiki/', 'index': 'index'}]
" let g:vimwiki_list = [{'path': '~/safe/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
"""""""""""""""""""""""""""""""""""

"""User Settings"""""
syntax on
set relativenumber
" set cursorline
set breakindent
set laststatus=2
set mouse=
set scrolloff=5
set splitright
set splitbelow
"set conceallevel=2
"Spelling
highlight clear SpellBad
highlight SpellBad gui=undercurl guisp=Red ctermfg=1 cterm=underline
highlight clear SpellLocal

" Set defualt *.tex format to latex
let g:tex_flavor = "latex"
" So Vim and Crontab work nicely together
autocmd filetype crontab setlocal nobackup nowritebackup
" disable bell
autocmd! GUIEnter * set vb t_vb=
" remove gui elements from gvim
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set guifont=dejavusansmono
"""""""""""""""""""""

"""Mappings""""""""""
"" quickfix list
nnoremap [e :lne<CR>
nnoremap ]e :lp<CR>
" toggle spell
nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>
" write buffer
nnoremap <leader>w :w<CR>
inoremap <leader>w <Esc>:w<CR>a
" delete buffer
nnoremap <leader>db :bd<CR>
"""""""""""""""""""""
