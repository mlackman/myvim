set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=indent,eol,start
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'JarrodCTaylor/vim-python-test-runner'
Plugin 'majutsushi/tagbar'
Plugin 'szw/vim-tags'
Plugin 'Valloric/YouCompleteMe'

call pathogen#incubate()
     filetype off
     syntax on
     filetype plugin indent on

set runtimepath^=~/.vim/bundle/ctrlp.vim
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Nerdtree
map ? :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

imap jk <esc>
map ; :CtrlP .<cr>
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd Filetype python setlocal ts=2 sts=2 sw=2

:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|png)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|\\tmp\\'

" vim-rspec
let g:rspec_command = "!bundle exec rspec {spec}"
map rc :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map rl :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" From vim-python-test-runner
nnoremap<Leader>da :DjangoTestApp<CR>
nnoremap<Leader>df :DjangoTestFile<CR>
nnoremap<Leader>dc :DjangoTestClass<CR>
nnoremap<Leader>dm :DjangoTestMethod<CR>
autocmd FileType python nnoremap rc :NosetestFile<CR>
nnoremap<Leader>nc :NosetestClass<CR>
nnoremap<Leader>nm :NosetestMethod<CR>
nnoremap<Leader>nb :NosetestBaseMethod<CR>
autocmd FileType python nnoremap rl :RerunLastTests<CR>

" tagbar
map tb :TagbarToggle<CR>
