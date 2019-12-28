" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'

" Interface
Plug 'vim-airline/vim-airline'

" Browsing
Plug 'scrooloose/nerdtree'
Plug '/usr/local/bin/fzf'
Plug 'junegunn/fzf.vim'

" Integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'mattn/emmet-vim'

" Language
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ==============================================================
" BASIC SETTINGS
" ==============================================================

set nu
set autoindent
set smartindent
set hlsearch
set cursorline
set encoding=utf-8

" Unified color scheme
let g:seoul256_background=235
colo seoul256

" tagbar settings (exuberant-ctags)
" brew install ctags-exuberant
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

" ==============================================================
" Mappings
" ==============================================================

" Save
" :help map-modes to see more about insert and normal mode maps
inoremap <C-s>     <C-O>:update<CR>
nnoremap <C-s>     :update<CR>
nnoremap <leader>s :update<CR>
nnoremap <leader>w :update<CR>

" Quit
inoremap <C-Q>     <esc>:q<CR>
nnoremap <C-Q>     :q<CR>
vnoremap <C-Q>     <esc>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>

" <leader>n | NERD Tree
map <leader>n :NERDTreeToggle<CR>
map <leader>m :TagbarToggle<CR>

" Easier split(pane) navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" new split panes to right and bottom
set splitbelow
set splitright
