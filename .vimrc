" vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" ここにプラグインを記述したら、.vimrcの更新をして、
" :PlugInstall を行うこと

" Make sure you use single quotes
Plug 'vim-jp/vimdoc-ja'

" add this line to your .vimrc file
Plug 'mattn/emmet-vim'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" Plug 'tomtom/tcomment_vim'

Plug 'tyru/caw.vim'

" Initialize plugin system
call plug#end()

" help日本語化
set helplang=ja,en


" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
" set nobackup
" バックアップファイルを作成
set backup
" スワップファイルを作らない
" set noswapfile
" スワップファイルを作成
set swapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
" set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

let $TMP_DIR='~/.vim/tmp'
if !isdirectory($TMP_DIR)
    call mkdir($TMP_DIR, "p")
endif

" バックアップファイルのディレクトリを指定する
set backupdir=$TMP_DIR

" swp output directory
set directory=$TMP_DIR

" .un~ ファイルを指定したディレクトリにまとめて生成
set undodir=$TMP_DIR
" echo $TMP_DIR

" クリップボード連携(コピー&ペースト)
set clipboard+=unnamed

"左右のカーソル移動で行間移動可能にする。(※要 set [no]compatible以降に記述)
set whichwrap=b,s,h,l,<,>,[,],~

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END



