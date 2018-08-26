""""Vundle Header""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'altercation/vim-colors-solarized'
Plugin 'lervag/vimtex'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'python-mode/python-mode'
Plugin 'easymotion/vim-easymotion'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""Plugin Settings""""""""""
"""solarized
colorscheme solarized
" set bg=dark

"""YCM
"c++ completion (default compile settings)
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" Don't ask about config files
let g:ycm_confirm_extra_conf = 0
"let g:ycm_warning_symbol = '->'
highlight YcmWarningSign guifg=DodgerBlue1
"Misc
let g:ycm_auto_trigger = 1
let g:ycm_python_binary_path = '/usr/bin/python'
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

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

"""pymode
let g:pymode_python = 'python3'
let g:pymode_breakpoint = 0
let g:pymode_rope_completion = 0
let g:pymode_rope = 0

"""easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
map <space>f <Plug>(easymotion-bd-f)
map <space>w <Plug>(easymotion-bd-w)
map <space>e <Plug>(easymotion-bd-e)
map <space>l <Plug>(easymotion-bd-jk)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" let g:EasyMotion_disable_two_key_combo = 0
"""""""""""""""""""""""""""""""""""

"""User Settings"""""
syntax on
set relativenumber
set cursorline
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
" toggle spell
nmap <leader>s :setlocal spell! spelllang=en_us<CR>
" write buffer
nmap <leader>w :w<CR>
imap <leader>w <Esc>:w<CR>a
" delete buffer
nmap <leader>db :bd<CR>
" escape
imap jw <Esc>
"""""""""""""""""""""
