if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/t_kawakami/.cache/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/deoplete.nvim

" Required:
if dein#load_state('/Users/t_kawakami/.cache/dein')
  call dein#begin('/Users/t_kawakami/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/t_kawakami/.cache/dein/repos/github.com/Shougo/dein.vim')
  " You can specify revision/branch/tag.
  " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Load Plugins:
  let s:toml = '~/.cache/dein/dein.toml'
  let s:lazy_toml = '~/.cache/dein/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
" call dein#recache_runtimepath()

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Grep:
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
		\ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
let s:ignore_globs = ['.git', '.svn', 'node_modules', 'log', 'logs']
call denite#custom#var('file/rec', 'command', [
      \ 'ag',
      \ '--follow',
      \ ] + map(deepcopy(s:ignore_globs), { k, v -> '--ignore=' . v }) + [
      \ '--nocolor',
      \ '--nogroup',
      \ '-g',
      \ ''
      \ ])
call denite#custom#source('file/rec', 'matchers', ['matcher/substring'])
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', s:ignore_globs)

" ColorScheme:
let g:dracula_colorterm = 0
colorscheme dracula

" General:
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard+=unnamedplus
set confirm
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set gdefault
set helpheight=999
set hlsearch
set ignorecase
set imdisable
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:▸,eol:↲,extends:>,precedes:<,nbsp:% "タブ、空白、改行の可視化
set nobackup
set noswapfile
set number
set scrolloff=50
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set softtabstop=0
set tabstop=2
set termencoding=utf-8
set wrapscan
set pastetoggle=<C-t><C-p>
set modifiable
set write

" Keymap:
nnoremap vs :vsplit<Cr>
nnoremap sp :split<Cr>
nnoremap <C-h> :vertical resize -5<cr>
nnoremap <C-j> :resize +5<cr>
nnoremap <C-k> :resize -5<cr>
nnoremap <C-l> :vertical resize +5<cr>
nnoremap <Esc><Esc> :w<CR>
nnoremap <C-q> :noh<CR>
nnoremap <C-s> :source ~/dotfiles/init.vim<CR>
nnoremap tt :tabnew<CR>
nnoremap <C-t><C-t> :q<CR>

" FileType:
let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.less.pug
autocmd BufRead,BufNewFile *.ts setlocal filetype=javascript.typescript

" Denite:
nnoremap <silent> ;f :<C-u>Denite file/rec -split=floating -winrow=1<CR>
nnoremap <silent> ;s :<C-u>Denite -buffer-name=search grep -split=floating -winrow=1<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
