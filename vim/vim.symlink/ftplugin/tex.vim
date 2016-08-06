" Set indent
set expandtab
set tabstop=4
set shiftwidth=4

" View pdf on <F8>
" nmap <F8> :VimtexView<CR>

" Turn on spell check
set spell
set spell spelllang=en_us

""" Vimtex settings
let g:vimtex_quickfix_mode = 2

"clean on close
:autocmd VimLeave *.tex :!latexmk -c

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

"" add insert mappings
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
