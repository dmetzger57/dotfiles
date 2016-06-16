" line numbers
set number
"
set shell=/bin/sh

" ignore case while searching
set ignorecase

" be smart about cases while searching
set smartcase

" hilight as you search
set hlsearch

" incremental search
set incsearch

" show matching brackets
set showmatch

" blink for .2 seconds when showing matching bracket
set mat=2

" enable syntax hilighting
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" Pathogen
" filetype off " Pathogen needs to run before plugin indent on
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags() " generate helptags for everything in 'runtimepath'
execute pathogen#infect()

let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_ruby_rubocop_args="-c $HOME/.rubocop.yml -D"
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_w = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_jump = 1
let g:syntastic_aggregate_errors = 1

nmap :rsc :SyntasticCheck
nmap :rsr :SyntasticReset

colorscheme delek

" use spaces for tabs
set expandtab
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" auto indent
" set ai
" smart indent
" set si

 " ctags optimization
 set autochdir
 set tags=tags;

if has('cscope')

  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src

  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
  nnoremap <C-l> :nohlsearch<CR><C-l>

  autocmd InsertEnter * :setlocal nohlsearch
  autocmd InsertLeave * :setlocal hlsearch
endif
