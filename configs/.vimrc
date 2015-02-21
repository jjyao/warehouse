"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" plugins

" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin list
Plugin 'gmarik/Vundle.vim'
Plugin 'BlockComment.vim'
Plugin 'taglist.vim'
Plugin 'Shougo/neocomplcache'
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'
"Plugin 'snipMate'
Plugin 'Align'
Plugin 'sudo.vim'
Plugin 'TaskList.vim'
Plugin 'compview'
Plugin 'altercation/vim-colors-solarized'
Plugin 'DoxygenToolkit.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'fs111/pydoc.vim'
Plugin 'edsono/vim-matchit'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Conque-Shell'
Plugin 'DataWraith/auto_mkdir'
Plugin 'skammer/vim-css-color'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'bingaman/vim-sparkup'
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
Plugin 'jsbeautify'
Plugin 'airblade/vim-gitgutter'
Plugin 'FencView.vim'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'LargeFile'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on

" doxygen
let g:DoxygenToolkit_authorName="jjyao" 

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=0
let g:syntastic_enable_signs=0
" :SyntasticToggleMode<CR>

" ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" neocomplcache
set runtimepath+=~/.vim/bundle/neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Use quick match
let g:neocomplcache_enable_quick_match = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
set completeopt-=preview
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic
set lbr
set ignorecase
set smartcase
set hlsearch
set incsearch
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showcmd
set showmode
set foldmethod=manual
set foldlevelstart=99
let g:mapleader = ','
set synmaxcol=512
set guifont=airline
" set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" abbreviation
ab hte the

" visual
syntax on
colorscheme solarized
set background=dark
set t_Co=16
set number
set listchars=tab:>-,trail:-
" set showmatch

" php
let php_sql_query=1

" status bar
set laststatus=2
"set statusline=
"set statusline+=[%F]
"set statusline+=\ [%{''.(&fenc!=''?&fenc:&enc).''}]
"set statusline+=\ %{SyntasticStatuslineFlag()}
"set statusline+=%=
"set statusline+=[%l/%L]
"set statusline+=\ [%P]
"hi statusline ctermfg=white ctermbg=black

" map
map <CR> o<Esc>
nnoremap ,- <C-w>s
nnoremap ,\| <C-w>v
nnoremap ,j <C-w>j
nnoremap ,k <C-w>k
nnoremap ,l <C-w>l
nnoremap ,h <C-w>h
nnoremap j gj
nnoremap k gk
nnoremap ; :
cmap w!! w !sudo tee % >/dev/null

" paste
set pastetoggle=<Leader>p
nnoremap <Leader>p :set invpaste paste?<CR>

nnoremap <Leader>tws :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins

" fugitive
nnoremap <silent> <leader>gst :Gstatus<CR>
nnoremap <silent> <leader>gdf :Gdiff<CR>
nnoremap <silent> <leader>gcm :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>glg :Glog<CR>
nnoremap <silent> <leader>gps :Git push<CR>

" compview
map <unique> <Leader>/ <Plug>CompView

" nerdtree
nnoremap <Leader>nt :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let g:nerdtree_tabs_open_on_gui_startup=0

" taglist
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 40
map <Leader>tl : TlistToggle<cr>
map <Leader>ct: !/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" sparkup
let g:sparkupExecuteMapping="<Leader>se"
let g:sparkupNextMapping="<Leader>sn"

" gundo
nnoremap <silent> <Leader>df :GundoToggle<CR>

" LargeFile
let g:LargeFile=500

" ctrlp
let g:ctrlp_working_path_mode = 'a'

" jsbeautify
" :call g:Jsbeautify()

" fencview
" :FencAutoDetect
" :FencView

" airline
let g:airline_powerline_fonts = 1
let g:airline_enable_fugitive = 1
let g:airline_theme='solarized'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline_section_z = '%l/%L: %2v'
function! AirlineInit()
    let g:airline_symbols.branch = ''
endfunction
autocmd VimEnter * call AirlineInit()
