if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/y99dra/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/y99dra/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/home/y99dra/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('raphamorim/lucario')
call dein#add('scrooloose/nerdtree')
call dein#add('nvie/vim-flake8')
call dein#add('tomtom/tcomment_vim')
call dein#add ('tpope/vim-fugitive')
call dein#add('Yggdroot/indentLine')
call dein#add('hokaccha/vim-html5validator')
call dein#add('puremourning/vimspector')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable
" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
"--------ここでdein.vimの設定終了,プラグイン追加はcall dein#add(xxx)--------

"deinのプラグイン削除の設定"
call map(dein#check_clean(), "delete(v:val, 'rf')")

"左端に行数を表示
set number

set encoding=utf-8
scriptencoding utf-8

set clipboard=unnamedplus

"swpファイル出力先"
set directory=~/vim_file/vim_swp
"backupファイル出力先"
set backupdir=~/vim_file/vim_backup
"undoファイル出力先"
set undodir=~/vim_file/vim_undo
"ステータスラインの設定
set laststatus=2
set showmode
set showcmd
set ruler

"lucarioの設定(vimの背景)
"色のテーマ
colorscheme lucario

syntax on
" 256色
set t_Co=256
" truecolor
set termguicolors
" 背景色
set background=dark

"nerdtree起動のためのショートカットキー
map <C-n> :NERDTreeToggle<CR>

"indentline"
let g:indentLine_color_term =239
let g:indentLine_color_gui = '#708090'
set list listchars=tab:\¦\ 
"vimでpython実行"
nmap <F5> :!python3 %
"検索した文字をハイライト
set hlsearch
"ハイライト表示を消す(ESCショートカット)
nmap <Esc><Esc> :nohl<CR>
"ハイライトの色
hi Search ctermfg=0 ctermbg=46
"terminalエイリアス"
command Ter bo term ++rows=10 
"vim更新エイリアス"
command Source source ~/.vimrc
"terminal-job→terminal-normalショートカットキー変更"
tnoremap <C-[> :<C-w>N
