if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

"------------------------------------------------- プラグイン以外のその他設定が続く--------------------------------------------------"

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

"python実行ショートカット"
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
tnoremap <C-[> <C-w>N

