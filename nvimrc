set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

" WARNING: The vim config file path for new nvim has changed
" this is the old one
"set rtp+=~/.nvim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-scripts/Lucius'
Plugin 'jelera/vim-javascript-syntax'
"Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'

"Plugin 'flowtype/vim-flow', {
"		\ 'autoload': {
"        \     'filetypes': 'javascript'
"        \ }}

" All of your Plugins must be added before the following line
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


""""""""""""""""""
" STANDARD SETUP "
""""""""""""""""""
syntax enable
set tabstop=4
set softtabstop=4
set shiftwidth=4

" change it for JS
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

set expandtab
set autoindent
set incsearch
set hlsearch
set number
set ruler
set wrap
set mouse=
set cursorline
set cursorcolumn
set backspace=indent,eol,start " backspace over everything in insert mode


colorscheme lucius
LuciusDarkLowContrast


"""""""""""""
" SHORTCUTS "
"""""""""""""
let mapleader = ","

" file operations
:map ,ffs :FufFile<CR>
:map ,fo <C-w>f

" location list
:map <leader>ln :lnext<CR>
:map <leader>lp :lprevious<CR>

" quick fix
:map <leader>cn :cnext<CR>
:map <leader>cp :cprevious<CR>

" python tools
:map ,pyf :!pyflakes %<CR>

" git
:map ,gb :!git blame %<CR>
:map ,gd :!git diff %<CR>

" textual helpers
:map ,c :s/^/#/<CR>
:map ,C :s/^#//<CR>

" scratch buffer
:map ,sb :Sscratch<CR>

" diff helpers
":map ,iw :set diffopt+=iwhite<CR>

" go
:map ,gor :GoRun %<CR>
:map ,gob :GoBuild<CR>
:map ,goi :GoInfo<CR>
:map ,goe :GoErrCheck<CR>
:map ,gof :GoFmt<CR>
let g:go_fmt_command = "goimports"
" TODO: add post-save GoErrCheck

" save output of command into new buffer
:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>


"""""""""
" CTAGS "
"""""""""
" use with ctags to jump to definition
:map ,b g<C-]>
:map ,B <C-W>g<C-]>

" for manual run
:map ,ct :let x = system("ctags --languages=python --python-kinds=-i --exclude=build --exclude=src --exclude=binary -R . `cat .ctags_paths` &")<CR>

"""""""
" ALE "
"""""""
let g:ale_javascript_eslint_executable = ["eslint_d"]
:map ,ll :lopen<CR>

"""""""""""""
" Syntastic "
"""""""""""""
"let g:syntastic_javascript_checkers = ["eslint"]
"let g:syntastic_javascript_eslint_exec = "eslint_d"
"let g:syntastic_python_checkers = ['flake8']  " use flake8 since it is faster

"""""""""""""
" ctrlp.vim "
"""""""""""""

:map ,F :CtrlP<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

