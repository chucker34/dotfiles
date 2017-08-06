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
