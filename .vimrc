syntax on
set nocompatible
set clipboard+=autoselect "クリップボードを使う
set clipboard+=unnamed
"文字コード
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

set backspace=indent,eol,start
set nobackup

" 画面表示の設定
set number         "行番号を表示する
set cursorline    "カーソル行の背景色を変える
"set cursorcolumn  "カーソル位置のカラムの背景色を変える
set laststatus=2   "ステータス行を常に表示
set cmdheight=2   "メッセージ表示欄を2行確保
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
"ファイル名を表示
set laststatus=2
"検索/置換の設定
set hlsearch   "検索文字列をハイライトする
set incsearch  "インクリメンタルサーチを行う
set ignorecase "大文字と小文字を区別しない
set smartcase  "大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   "最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   "置換の時 g オプションをデフォルトで有効にする

"ファイル関連"
set autoread   "外部でファイルに変更がされた場合は読みなおす
set noswapfile "ファイル編集中にスワップファイルを作らない
set confirm    "保存されていないファイルがあるときは終了前に保存確認
set imdisable  "IMEオフ

"set mouse+=a

"記号補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap <% %><LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
"改行インデント
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

"バンドル管理
"Vi互換OFF
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif

"プラグイン
NeoBundle 'nginx.vim'
NeoBundle 'osyo-manga/vim-sound'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle '844196/lightline-badwolf.vim'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'sjl/badwolf'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'jpo/vim-railscasts-theme'
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

"コード補完の設定
"let g:neosnippet#snippets_directory='~/.vim/bundle/snippets/ruby_snip/*.snip'
let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_smart_case = 1
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_manual_completion_start_length = 0
"let g:neocomplcache_caching_percent_in_statusline = 1
"let g:neocomplcache_enable_skip_completion = 1
"let g:neocomplcache_skip_input_time = '0.5'

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
NeoBundleCheck

"ショートカット
map <C-n> :NERDTreeToggle<Cr>
nnoremap sh :VimShell<Cr>
nnoremap vs :vsplit<Cr>
"カット実行
map <C-d> d's
"ヤンクを実行
map <C-y> y's
map <Esc> :w<CR>
map <C-e> :noh<CR>
nnoremap tt :<C-u>tabnew<CR>:NERDTreeToggle<CR>
set pastetoggle=<F10>
"ウィンドウを２つ閉じる
map <C-t><C-t> :q<CR>:q<CR>
" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"カラーテーマ
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_contrast = "high"
let g:solarized_degrade = 0
"let g:rehash256 = 1
"let g:molokai_original = 0
"colorscheme molokai
"let g:hybrid_use_Xresources = 1
""colorscheme molokai
""colorscheme hybrid
""colorscheme jellybeans
""colorscheme badwolf
"colorscheme Tomorrow-Night
""colorscheme gruvbox
""colorscheme candy
""colorscheme solarized
""colorscheme codeschool
""colorscheme railscasts
""colorscheme lucius
colorscheme iceberg

"Nerdtree設定
let NERDTreeShowHidden = 1
autocmd VimEnter * execute 'NERDTree'

"オートコマンド
autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip

autocmd BufWritePre * :%s/\s\+$//e "保存時に空白削除
autocmd BufWritePre * :%s/\t/ /ge "保存時にtabをスペースに変換
" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby
au BufRead,BufNewFile /etc/nginx/* set ft=nginx

"autocmd FileType ruby compiler ruby
"autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby

augroup Close
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

