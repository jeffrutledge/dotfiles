" Set indent
set expandtab
set tabstop=4
set shiftwidth=4

" Turn on spell check
set spell
set spell spelllang=en_us

""" Vimtex settings
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 0

""" Mapping
"toggle if warnings open quickfix window
nnoremap <leader>lw :let vimtex_quickfix_open_on_warning=!vimtex_quickfix_open_on_warning<CR>:echo vimtex_quickfix_open_on_warning<CR>

"clean on close
augroup vimtex_config
  au!
  au VimLeave *.tex :!latexmk -c
  au User VimtexEventInitPost VimtexCompile
augroup END

let g:vimtex_view_method = 'zathura'

if has('macunix')
  "use Skim
  let g:vimtex_view_general_viewer
        \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
  let g:vimtex_view_general_options = '-r @line @pdf @tex'
  
  " This adds a callback hook that updates Skim after compilation
  let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
  function! UpdateSkim(status)
    if !a:status | return | endif
  
    let l:out = b:vimtex.out()
    let l:tex = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']
    if !empty(system('pgrep Skim'))
      call extend(l:cmd, ['-g'])
    endif
    if has('nvim')
      call jobstart(l:cmd + [line('.'), l:out, l:tex])
    elseif has('job')
      call job_start(l:cmd + [line('.'), l:out, l:tex])
    else
      call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
    endif
  endfunction
endif

" let auto complete work with YCM
if !exists('g:ycm_semantic_triggers')
let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
    \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
    \ 're!\\hyperref\[[^]]*',
    \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\(include(only)?|input){[^}]*'
    \ ]

""" turn on conceal syntax
" set cole=2
let g:tex_conceal= 'adgm'

""" add insert mappings

"" Math Bolds
" Probability
call vimtex#imaps#add_map({
    \ 'lhs' : 'pp',
    \ 'rhs' : '\mathbb{P}',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
" Expected Value
call vimtex#imaps#add_map({
    \ 'lhs' : 'ee',
    \ 'rhs' : '\mathbb{E}',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
" Complex
call vimtex#imaps#add_map({
    \ 'lhs' : 'cc',
    \ 'rhs' : '\mathbb{C}',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
" Reals
call vimtex#imaps#add_map({
    \ 'lhs' : 'rr',
    \ 'rhs' : '\mathbb{R}',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
" Rationals
call vimtex#imaps#add_map({
    \ 'lhs' : 'qq',
    \ 'rhs' : '\mathbb{Q}',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
" Integers
call vimtex#imaps#add_map({
    \ 'lhs' : 'zz',
    \ 'rhs' : '\mathbb{Z}',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
" Naturals
call vimtex#imaps#add_map({
    \ 'lhs' : 'nn',
    \ 'rhs' : '\mathbb{N}',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})

"" Math Scripts
" Riemann Integrable
call vimtex#imaps#add_map({
    \ 'lhs' : 'sr',
    \ 'rhs' : '\mathscr{R}',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
" P
call vimtex#imaps#add_map({
    \ 'lhs' : 'sp',
    \ 'rhs' : '\mathscr{P}',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})

"" Math Vars
" varPhi
call vimtex#imaps#add_map({
    \ 'lhs' : 'vf',
    \ 'rhs' : '\varphi',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})

"" Operators
" sqrt
call vimtex#imaps#add_map({
    \ 'lhs' : '/',
    \ 'rhs' : '\sqrt{',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
" frac
call vimtex#imaps#add_map({
    \ 'lhs' : '-',
    \ 'rhs' : '\frac{',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
" duel
call vimtex#imaps#add_map({
    \ 'lhs' : '^',
    \ 'rhs' : '\widehat ',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})
