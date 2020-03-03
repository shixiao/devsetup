set tabstop=2
set softtabstop=2
set shiftwidth=2
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
set tw=80
set expandtab
set number
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
nnoremap gV `[v`]
set history=10000
syntax enable
set background=dark

exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
set list

nnoremap ; :
nnoremap : ;
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'JuliaLang/julia-vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tomasr/molokai'
Plugin 'chrisbra/vim-show-whitespace'
Plugin 'majutsushi/tagbar'
Plugin 'lyuts/vim-rtags'
Plugin 'tpope/vim-commentary'
" Plugin 'vim-scripts/tla.vim'
Plugin 'florentc/vim-tla'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'lervag/vimtex'

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

let g:cpp_class_scope_highlight = 1

colorscheme molokai
