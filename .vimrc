if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

set nocompatible
set clipboard+=autoselect
set clipboard+=unnamed
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set nobackup
set number
set laststatus=2
set showmatch
set helpheight=999
set list
set listchars=tab:▸\ ,trail:▸,eol:↲,extends:>,precedes:<,nbsp:% "タブ、空白、改行の可視化
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0
set autoindent
set smartindent
set scrolloff=50
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault
set autoread
set noswapfile
set confirm
set imdisable
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"inoremap <% <% %><LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>
"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap [<Enter> []<Left><CR><ESC><S-o>
"inoremap (<Enter> ()<Left><CR><ESC><S-o>

"一旦ファイルタイプ関連を無効化する
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'tomtom/tcomment_vim'
  NeoBundle "ctrlpvim/ctrlp.vim"
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'airblade/vim-gitgutter'
  NeoBundle 'itchyny/lightline.vim'
  "NeoBundle 'Lokaltog/vim-powerline'
  "NeoBundle 'scrooloose/syntastic'
  NeoBundle 'AndrewRadev/vim-eco'
  NeoBundle 'dsawardekar/wordpress.vim'
  NeoBundle 'hail2u/vim-css3-syntax'
  NeoBundle 'groenewege/vim-less'
  NeoBundle 'sudo.vim'
  NeoBundle 'nginx.vim'
  NeoBundle 'osyo-manga/vim-sound'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'cocopon/iceberg.vim'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/neocomplete'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'linux' : 'make',
    \     'unix' : 'gmake',
    \    },
    \ }
  NeoBundle 'Quramy/tsuquyomi'
  NeoBundle 'skwp/vim-rspec.git'
  NeoBundle 'Keithbsmiley/rspec.vim'
  NeoBundle 'vim-ruby/vim-ruby'
  NeoBundle 'tpope/vim-rails.git'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'toyamarinyon/vim-swift'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'slim-template/vim-slim'
  NeoBundle "pangloss/vim-javascript"
  NeoBundle "othree/yajs"
  NeoBundle 'mxw/vim-jsx'
  NeoBundle 'alvan/vim-closetag'
  NeoBundle 'w0rp/ale'
  NeoBundle 'ekalinin/Dockerfile.vim'
  NeoBundle 'aliva/vim-fish'
  NeoBundle 'whatyouhide/vim-tmux-syntax'
  NeoBundle 'leafgarland/typescript-vim'
  NeoBundle 'IN3D/vim-raml'
  NeoBundle 'vim-multiple-cursors'
  NeoBundle 'cohama/lexima.vim'
  NeoBundleCheck
  call neobundle#end()
endif

"neocomplete
let g:neocomplete#enable_at_startup = 1
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml*,*.js,*.jsx,*.erb"

nnoremap <C-m><C-n> :NERDTreeToggle<Cr>
nnoremap vs :vsplit<Cr>
nnoremap sp :split<Cr>
nnoremap <C-h> :vertical resize -5<cr>
nnoremap <C-j> :resize +5<cr>
nnoremap <C-k> :resize -5<cr>
nnoremap <C-l> :vertical resize +5<cr>
map <C-d> d's
map <C-y> y's
map <Esc><Esc> :w<CR>
map <C-q> :noh<CR>
nnoremap tt :<C-u>tabnew<CR>:NERDTreeToggle<CR>
set pastetoggle=<C-m><C-p>
map <C-t><C-t> :q<CR>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"カラースキーム
syntax enable
set background=dark
set t_Co=256
let g:solarized_contrast = "high"
let g:solarized_degrade = 0
colorscheme solarized

"if !has('gui_running')
"endif

"Nerdtree
let NERDTreeShowHidden = 1
autocmd VimEnter * if (@% != '.git/COMMIT_EDITMSG' && @% != '.git/PULLREQ_EDITMSG') | NERDTree | endif
let NERDTreeIgnore = ['\.DS_Store$']

"ファイルタイプ
filetype plugin on
filetype indent on
autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails.model*                NeoSnippetSource ~/.vim/snippet/ruby.rails.model.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip
"autocmd BufWritePre * :%s/\s\+$//e "保存時に空白削除
"autocmd BufWritePre * :%s/\t/ /ge "保存時にtabをスペースに変換
au BufRead,BufNewFile *.jbuilder set ft=ruby
au BufNewFile,BufRead *.html.erb.deface set syntax=eruby.html
au BufRead,BufNewFile */etc/*.conf set ft=conf
au BufRead,BufNewFile */etc/*.cnf set ft=conf
au BufRead,BufNewFile */nginx/* set ft=nginx
au BufNewFile,BufRead *.slim.bk set syntax=slim
au BufRead,BufNewFile .env.* set ft=sh
au BufRead,BufNewFile .envrc set ft=sh
let g:jsx_ext_required = 0
augroup Close
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END
autocmd Filetype json setl conceallevel=0
au BufRead,BufNewFile Podfile set filetype=ruby

"ステータスライン
""let g:syntastic_loc_list_height = 3
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0
""let g:syntastic_eruby_ruby_quiet_messages =
""  \ {'regex': ['possibly useless use of a variable in void context', 'possibly useless use of + in void context']}
""let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }

""let g:Powerline_symbols = 'fancy'
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'mode_map': {'c': 'NORMAL'},
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['fugitive'],
  \     ['relativepath', 'ale'],
  \   ],
  \   'right': [
  \     ['lineinfo'],
  \     ['percent'],
  \     ['fileformat', 'fileencoding', 'filetype'],
  \   ]
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'component': {
  \ },
  \ 'component_visible_condition': {
  \ },
  \'component_function': {
  \  'fugitive': 'LightlineFugitive',
  \  'ale': 'ALEStatus'
  \ },
\ }

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

"ale
function! ALEStatus()
  return ALEGetStatusLine()
endfunction
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"ctrlP
let g:ctrlp_map = '<c-s>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|)$'
let g:ctrlp_custom_ignore = '\v[\/](public)$'

"if !empty(glob("~/dotfiles/Typewriter_Sound_FXs/"))
"  "type音
"  function! PlaySE(name)
"    silent! exec '!afplay ~/dotfiles/Typewriter_Sound_FXs/' . a:name . '.wav &'
"  endfunction
"  " 補完を閉じる
"  autocmd CompleteDone * call PlaySE("Return")
"  " バッファ移動
"  autocmd BufEnter * call PlaySE("Spacebar")
"  " 入力
"  autocmd InsertCharPre * call PlaySE("1_click")
"  " 保存
"  autocmd BufWrite * call PlaySE("End_bell_tab")
"  " インサートモード IN / OUT
"  autocmd InsertEnter * call PlaySE("Page_holder_close")
"  autocmd InsertLeave * call PlaySE("Page_holder_close")
"endif

let g:gitgutter_max_signs = 1000

command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction
