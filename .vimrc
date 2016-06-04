set nocompatible
set clipboard+=autoselect "クリップボードを使う
set clipboard+=unnamed
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set nobackup
set number         "行番号を表示する
set cursorline    "カーソル行の背景色を変える
set laststatus=2   "ステータス行を常に表示
set showmatch      "対応する括弧を強調表示
set helpheight=999 "ヘルプを画面いっぱいに開く
set list           "不可視文字を表示
set listchars=tab:▸\ ,trail:▸,eol:↲,extends:>,precedes:<,nbsp:% "タブ、空白、改行の可視化
set expandtab
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=0 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set scrolloff=50
set hlsearch   "検索文字列をハイライトする
set incsearch  "インクリメンタルサーチを行う
set ignorecase "大文字と小文字を区別しない
set smartcase  "大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   "最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   "置換の時 g オプションをデフォルトで有効にする
set autoread   "外部でファイルに変更がされた場合は読みなおす
set noswapfile "ファイル編集中にスワップファイルを作らない
set confirm    "保存されていないファイルがあるときは終了前に保存確認
set imdisable  "IMEオフ
"記号補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap <% <% %><LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
"改行インデント
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
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
  NeoBundle 'Lokaltog/vim-powerline'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'AndrewRadev/vim-eco'
  NeoBundle 'brendonrapp/smyck-vim'
  NeoBundle 'vim-scripts/guicolorscheme.vim'
  NeoBundle 'dsawardekar/wordpress.vim'
  NeoBundle 'hail2u/vim-css3-syntax'
  NeoBundle 'groenewege/vim-less'
  NeoBundle 'sudo.vim'
  NeoBundle 'nginx.vim'
  NeoBundle 'osyo-manga/vim-sound'
  NeoBundle 'cocopon/iceberg.vim'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle '844196/lightline-badwolf.vim'
  NeoBundle 'tomasr/molokai'
  NeoBundle 'sjl/badwolf'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/vimfiler'
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make -f make_mac.mak',
        \     'unix' : 'make -f make_unix.mak',
        \    },
        \ }
  NeoBundle 'skwp/vim-rspec.git'
  NeoBundle 'Keithbsmiley/rspec.vim'
  NeoBundle 'vim-ruby/vim-ruby'
  NeoBundle 'tpope/vim-rails.git'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'candy.vim'
  "swift
  NeoBundle 'toyamarinyon/vim-swift'
  "NeoBundle 'Keithbsmiley/swift.vim'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'slim-template/vim-slim'
  NeoBundleCheck
  call neobundle#end()
endif

"コード補完
let g:neocomplcache_enable_at_startup = 1
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

filetype plugin on
filetype indent on

"キーバインド
map <C-n> :NERDTreeToggle<Cr>
nnoremap vs :vsplit<Cr>
nnoremap sp :split<Cr>
"windowサイズ変更
nnoremap <C-l> :vertical resize -5<cr>
nnoremap <C-k> :resize +5<cr>
nnoremap <C-j> :resize -5<cr>
nnoremap <C-h> :vertical resize +5<cr>
"カット実行
map <C-d> d's
"ヤンクを実行
map <C-y> y's
map <Esc><Esc> :w<CR>
map <C-q> :noh<CR>
nnoremap tt :<C-u>tabnew<CR>:NERDTreeToggle<CR>
set pastetoggle=<C-p>
"ウィンドウを２つ閉じる
map <C-t><C-t> :q<CR>:q<CR>
" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
map <C-a> ^
map <C-z> $

"カラースキーム
syntax enable
set background=dark
set t_Co=256
let g:solarized_contrast = "high"
let g:solarized_degrade = 0
colorscheme solarized
""colorscheme molokai
""colorscheme jellybeans
""colorscheme iceberg
""colorscheme smyck
if !has('gui_running')
""autocmd VimEnter * :GuiColorScheme iceberg
""autocmd VimEnter * :GuiColorScheme smyck
endif

"Nerdtree
let NERDTreeShowHidden = 1
"autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
autocmd VimEnter * if (@% != '.git/COMMIT_EDITMSG' && @% != '.git/PULLREQ_EDITMSG') | NERDTree | endif
let NERDTreeIgnore = ['\.DS_Store$']

"ファイルタイプ
autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails.model*                NeoSnippetSource ~/.vim/snippet/ruby.rails.model.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip
autocmd BufWritePre * :%s/\s\+$//e "保存時に空白削除
autocmd BufWritePre * :%s/\t/ /ge "保存時にtabをスペースに変換
au BufRead,BufNewFile *.jbuilder set ft=ruby
au BufNewFile,BufRead *.html.erb.deface set syntax=eruby.html
au BufRead,BufNewFile */etc/*.conf set ft=conf
au BufRead,BufNewFile */etc/*.cnf set ft=conf
au BufRead,BufNewFile */nginx/* set ft=nginx

augroup Close
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

"ステータスライン
"syntastic https://github.com/scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_eruby_ruby_quiet_messages =
  \ {'regex': ['possibly useless use of a variable in void context', 'possibly useless use of + in void context']}

let g:Powerline_symbols = 'fancy'
let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'relativepath'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component': {
        \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
        \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
        \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
        \ },
        \ 'component_visible_condition': {
        \   'readonly': '(&filetype!="help"&& &readonly)',
        \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
        \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
        \ },
        \ }

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
