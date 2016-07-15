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
Plugin 'scrooloose/syntastic'
Plugin 'hynek/vim-python-pep8-indent'


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
set expandtab
set autoindent
set incsearch
set hlsearch
set number
set ruler
set wrap
set mouse=


colorscheme lucius
LuciusDarkLowContrast


"""""""""""""
" SHORTCUTS "
"""""""""""""
" file operations
:map ,ffs :FufFile<CR>
:map ,fo <C-w>f
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
:map ,iw :set diffopt+=iwhite<CR>


"""""""""
" CTAGS "
"""""""""
" use with ctags to jump to definition
:map ,b g<C-]>
:map ,B <C-W>g<C-]>

" for manual run
:map ,ct :let x = system("ctags --languages=python --python-kinds=-i --exclude=build --exclude=src --exclude=binary -R . `cat .ctags_paths` &")<CR>


"""""""""""""
" Syntastic "
"""""""""""""
let g:syntastic_javascript_checkers = ["eslint"]
