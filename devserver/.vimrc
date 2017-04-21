set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim.before/bundle')
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tomasr/molokai'
Plugin 'chrisbra/vim-show-whitespace'
Plugin 'majutsushi/tagbar'
Plugin 'lyuts/vim-rtags'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/tla.vim'
Plugin 'mkitt/tabline.vim'
Plugin 'jlanzarotta/bufexplorer'

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

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

source ~/.vim.before/bundle/tla.vim/colors/tla.vim

try
source /mnt/vol/engshare/admin/scripts/vim/fbvim.vim
source ~/.vim_runtime/my_configs.vim
catch
endtry

nnoremap ; :
nnoremap : ;

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

set textwidth=80
set wrapmargin=0
set nowrap
set colorcolumn=+1

set tabstop=2
set softtabstop=2
set expandtab
" set number
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
nnoremap gV `[v`]
set history=10000
syntax enable
let g:cpp_class_scope_highlight = 1

let g:syntastic_lua_checkers = ["luac", "flychecklint"]
let g:syntastic_aggregate_errors = 1
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:rehash256 = 1
let g:molokai_original = 1

colorscheme molokai

map <C-K> :pyf /usr/local/share/clang/clang-format.py<CR>
imap <C-K> <ESC>:pyf /usr/local/share/clang/clang-format.py<CR>i
source $LOCAL_ADMIN_SCRIPTS/master.vimrc

set number
set autoread

au FocusGained,BufEnter * :silent! !

" vim-rtags bindings
let g:rtagsUseDefaultMappings = 0
let g:rtagsJumpStackMaxSize = 2000
let g:rtagsUseLocationList = 0
noremap <C-T>. :call rtags#JumpTo(g:SAME_WINDOW)<CR>
noremap <C-T>b <C-o>
noremap <C-T>f :call rtags#FindRefs()<CR>
noremap <C-T>n :call rtags#FindRefsByName(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <C-T>s :call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <C-T>r :call rtags#ReindexFile()<CR>
noremap <C-T>M :call rtags#SymbolInfo()<CR>

" fold
set foldmethod=syntax
set foldlevelstart=10

set hlsearch
" set autochdir

hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set nowrap

if getcwd() =~ "fbcode"
  let &path .= "," . system("hg root")[:-2] . "/fbcode"
endif
