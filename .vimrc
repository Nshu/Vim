set encoding=utf-8
" 行番号を表示
set number
" 括弧入力時の対応する括弧を表示
set showmatch
"---key mapping-----------------------------------
" 矢印キーを無効にする
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
" Esc二度押しでハイライト解除
nnoremap <silent> <Esc><Esc> :noh<LF>
" タブ操作
nnoremap <c-/> :tabnew 
" ウィンドウ分割で新規ファイルを開くようにする
nnoremap <c-w><c-v> <Nop>
nnoremap <c-w>v <Nop>
nnoremap <c-w><c-v> :vnew 
nnoremap <c-w>v :vnew 
nnoremap <c-w><c-s> <Nop>
nnoremap <c-w>s <Nop>
nnoremap <c-w><c-s> :new 
nnoremap <c-w>s :new 
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %
" vim-quickrun
nnoremap <F11> :QuickRun<LF>
" pdb,py
nnoremap <F12> :!py C:\Users\abata\Anaconda3\envs\condapy3_6_4\Lib\pdb.py %<LF>
"---end key mapping----------------------------------------------
" 自動インデント
set smartindent
" ファイルの保存をしていなくても、べつのファイルを開けるようにする
set hidden
" ----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" 検索結果をハイライト表示
set hlsearch

" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" クリップボードとレジスタを同期
set clipboard=unnamed
",autoselect
" インデント指定
set shiftwidth=2      
" swap,undo,backupファイルの生成位置を変える
set noswapfile
set nobackup
set noundofile

syntax enable
"set t_Co=256
colorscheme industry

"highlight Constant ctermfg=Red 
"highlight Identifier ctermfg=Cyan 
"highlight Statement ctermfg=Yellow 
"highlight Title ctermfg=Magenta "highlight Special ctermfg=Magenta 

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_path = expand('~/.vim/dein')
let s:dein_repo_path = s:dein_path . '\repos\github.com\Shougo\dein.vim'

" dein.vim がなければ github からclone
if &runtimepath !~# '\dein.vim'
  if !isdirectory(s:dein_repo_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
  endif
  execute 'set runtimepath^=' . s:dein_repo_path
endif

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  let g:config_dir  = expand('~/.vim/dein')
  let s:toml        = g:config_dir . '\plugins.toml'
  let s:lazy_toml   = g:config_dir . '\plugins_lazy.toml'

  " TOML 読み込み
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif


" Required:
filetype plugin indent on
syntax enable

" インストールされていないプラグインがあればインストールする
" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif
"End dein Scripts------------------------
