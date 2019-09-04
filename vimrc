let g:loaded_youcompleteme = 1
set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=indent,eol,start
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
Plug 'janko-m/vim-test'
Plug 'crusoexia/vim-monokai'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()


call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'IN3D/vim-raml'
"Plugin 'thoughtbot/vim-rspec'
"Plugin 'JarrodCTaylor/vim-python-test-runner'
Plugin 'majutsushi/tagbar'
Plugin 'szw/vim-tags'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flebel/vim-mypy', { 'for': 'python', 'branch': 'bugfix/fast_parser_is_default_and_only_parser' }

call pathogen#infect()

:let mapleader=","
set runtimepath^=~/.vim/bundle/ctrlp.vim
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
:set ignorecase
filetype off
syntax on

" default fold method
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

filetype plugin indent on
" Nerdtree
map ? :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

map rc :TestFile<CR>
map rl :TestLast<CR>
map rn :TestNearest<CR>
map å :set invpaste<cr>i

imap jk <esc>
nmap ; :CtrlP .<cr>
nmap <Leader>t :Files<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["html"]}

autocmd BufRead,BufNewFile *.svelte setfiletype html

autocmd BufWritePre * :%s/\s\+$//e
" Remove blank lines from end of the file
autocmd BufWritePre *.py :silent! %s#\($\n\s*\)\+\%$##
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2 foldmethod=syntax
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2

:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|png)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|\\tmp\\'

" vim-rspec
let g:rspec_command = "!bundle exec rspec {spec}"
"map rc :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map rl :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>

" From vim-python-test-runner
"nnoremap<Leader>da :DjangoTestApp<CR>
"nnoremap<Leader>df :DjangoTestFile<CR>
"nnoremap<Leader>dc :DjangoTestClass<CR>
"nnoremap<Leader>dm :DjangoTestMethod<CR>
"autocmd FileType python nnoremap rc :NosetestFile<CR>
"nnoremap<Leader>nc :NosetestClass<CR>
"nnoremap<Leader>nm :NosetestMethod<CR>
"nnoremap<Leader>nb :NosetestBaseMethod<CR>
"autocmd FileType python nnoremap rl :RerunLastTests<CR>

" tagbar
map tb :TagbarToggle<CR>
" Remove trailing whitespace automatically
autocmd BufWritePre * :%s/\s\+$//e

colorscheme monokai
" colorscheme proton
set t_Co=256  " vim-monokai now only support 256 colours in terminal.

let test#python#nose#options='-s -d'
let test#python#runner = 'pytest'
let test#javascript#mocha#options='-r esm'
"let test#python#runner = 'nose'

