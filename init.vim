if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/kawakami/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/kawakami/.config/nvim/dein')
  call dein#begin('/Users/kawakami/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/kawakami/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " ColorScheme:
  call dein#add('altercation/vim-colors-solarized')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" ColorScheme:
set background=dark
colorscheme solarized

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
