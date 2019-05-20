if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/kawakami/.config/nvim/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/deoplete.nvim

" Required:
if dein#load_state('/Users/kawakami/.config/nvim/dein')
  call dein#begin('/Users/kawakami/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/kawakami/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
  " You can specify revision/branch/tag.
  " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Load Plugins:
  let s:toml = '~/.config/nvim/dein/dein.toml'
  let s:lazy_toml = '~/.config/nvim/dein/dein_lazy.toml'
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
nnoremap <silent> ;s :<C-u>Denite file/rec<CR>
nnoremap <silent> ;g :<C-u>Denite -buffer-name=search -mode=normal grep<CR>

let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.less.pug
autocmd BufRead,BufNewFile *.ts setlocal filetype=javascript.typescript

