" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'

" Interface
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'

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
Plug 'udalov/kotlin-vim'

" Vimwiki
Plug 'vimwiki/vimwiki', { 'tag': 'v2.4.1' }

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

" vimwiki related options
filetype plugin on
syntax on

let wiki = {}
let wiki.path = '~/dev/pierceh89.github.io/_wiki/'
let wiki.ext = '.md'

let g:vimwiki_list = [wiki]
" 아무것도 숨기지 않도록 설정
let g:vimwiki_conceallevel = 0 
let g:vimwiki_table_mappings = 0
let g:md_modify_disabled = 0
" vimwiki 설정이 markdown 설정을 침투하지 않게 하기
let g:vimwiki_global_ext = 0

" updated column을 자동으로 채워주는 코드
function! LastModified()
    if g:md_modify_disabled
        return
    endif
    if &modified
        " echo('markdown updated time modified')
        let save_cursor = getpos(".")
        let n = min([10, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,10}updated\s*: \).*#\1' .
            \ strftime('%Y-%m-%d %H:%M:%S +0900') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun

" 새로운 문서 파일을 만들었을 때 기본 형식이 입력되도록 한다
function! NewTemplate()

    let l:wiki_directory = v:false

    for wiki in g:vimwiki_list
        if expand('%:p:h') . '/' == wiki.path
            let l:wiki_directory = v:true
            break
        endif
    endfor

    if !l:wiki_directory
        return
    endif

    if line("$") > 1
        return
    endif

    let l:template = []
    call add(l:template, '---')
    call add(l:template, 'layout  : wiki')
    call add(l:template, 'title   : ')
    call add(l:template, 'summary : ')
    call add(l:template, 'date    : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'updated : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'tags    : ')
    call add(l:template, 'toc     : true')
    call add(l:template, 'public  : true')
    call add(l:template, 'parent  : ')
    call add(l:template, 'latex   : false')
    call add(l:template, '---')
    call add(l:template, '* TOC')
    call add(l:template, '{:toc}')
    call add(l:template, '')
    call add(l:template, '# ')
    call setline(1, l:template)
    execute 'normal! G'
    execute 'normal! $'

    echom 'new wiki page has created'
endfunction

augroup vimwikiauto
	autocmd BufWritePre *wiki/*.md call LastModified()
	autocmd BufRead,BufNewFile *wiki/*.md call NewTemplate()
augroup END

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

" ctags for markdown
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
            \ 'h:headings',
            \ 'l:links',
            \ 'i:images'
        \ ],
    \ "sort" : 0
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

" vimwiki mappings
" \ww to open vimwiki index
nmap <LocalLeader>ww <Plug>VimwikiIndex
" \wt for markdown table
" nmap <LocalLeader>wt :VimwikiTable<CR>

" F4 키를 누르면 커서가 놓인 단어를 위키에서 검색한다.
nnoremap <F4> :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>

" Shift F4 키를 누르면 현재 문서를 링크한 모든 문서를 검색한다
nnoremap <S-F4> :execute "VWB" <Bar> :lopen<CR>

" new split panes to right and bottom
set splitbelow
set splitright

