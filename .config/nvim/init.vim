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
Plug 'tpope/vim-repeat'

" Language
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ==============================================================
" BASIC SETTINGS
" ==============================================================
set nocompatible
set nu
set autoindent
set hlsearch
set cursorline
set encoding=utf-8

set smartindent
set tabstop=4
set shiftwidth=4

" Unified color scheme
let g:seoul256_background=235
colo seoul256

" airline config
let g:airline#extensions#tabline#enabled = 1              " vim-airline 버퍼 목록 켜기
let g:airline#extensions#tabline#fnamemod = ':t'          " vim-airline 버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format

" tagbar settings (exuberant-ctags)
" brew install ctags-exuberant
let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

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

