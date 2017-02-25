scriptencoding utf-8
set ts=4 sts=2 sw=2 tw=0 ff=unix ft=VIM fdm=marker wrap noai
set modeline
set modelines=10
" An example for a Japanese version vimrc file.
" (~/.vimrc) - Vim 7.4
" Last Change: 2017/02/25 21:35:23.
" Editor: Sato Tomohiko 
" ==========================================================
"" 起動時に直接指定するプラグイン  {{{
:so ~/.vim/plugins/kaoriya/plugin/autodate.vim
:so ~/.vim/plugins/kaoriya/plugin/dicwin.vim
"}}}

"" runtimepath の順位 (確認 :echo &runtimepath) {{{
"" For UNIX
set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after"
set runtimepath^=~/.vim/plugins/kaoriya/plugin/
"" }}}

"" Plugins {{{
"dein Scripts----------------------------- {{{
" Vim起動完了時にインストール
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END
" 各プラグインをインストールするディレクトリ(~/.vim/bundle)
let s:plugin_dir = expand('~/.vim/bundles/')
" dein.vimをインストールするディレクトリをランタイムパスへ追加
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir
" dein.vimがまだ入ってなければ 最初に`git clone`
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif
if &compatible
  set nocompatible               " Be iMproved
endif
if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)
"" Required:
set runtimepath+=/home/owner/.vim/bundles/repos/github.com/Shougo/dein.vim
call dein#begin('/home/owner/.vim/bundles')
" Let dein manage dein
call dein#add('Shougo/dein.vim')
" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/unite.vim')
call dein#add('tyru/open-browser.vim')
call dein#add('vifm/vifm.vim')
" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
" Required:
call dein#end()
" Required:
filetype plugin indent on
syntax enable

"" If you want to install not installed plugins on startup.
"  if dein#check_install()
"    call dein#install()
"  endif
"  call dein#end()
  call dein#save_state()
endif

"End dein Scripts-------------------------}}}
" * Vimプラグインの管理にdein.vimを使う - yuhei.kagaya
" http://yuheikagaya.hatenablog.jp/entry/2016/03/20/171907
"" }}}

" 参考 (Reference): {{{
"   :help vimrc
"   :echo $HOME
"   :echo $VIM
"   :echo $VIMRUNTIME
"   :set runtimepath
"   :version
" }}}

"" Link {{{
" ../
" ./
" 
"$VIM = /usr/local/share/vim
"$VIMRUNTIME = /usr/local/share/vim/vim73
" ~/.gvimrc
"" Script:
"" http://www.vim.org/scripts/script.php
" vifm: https://vifm.info/

"" Restore missing gvim menu bar under GNOME {{{
" http://vim.wikia.com/wiki/Restore_missing_gvim_menu_bar_under_GNOME" rm ~/.gnome/Vim
" rm ~/.gnome2/Vim
"" }}}
"" }}}

" # Useful command: {{{
"" 任意の文字コードで保存する
" :setl fenc=(文字コード)
" 
"" 文字化けしたファイルを開きなおす
" :e ++enc=(文字コード {UTF-8})
" }}}

""  ## Vimの短縮入力 (Abbreviations) {{{
"""" -----------------------------------------------------------------------
"" * Drawing comment boxes
"" http://www.oualline.com/vim-cook.html#drawing
iab lc:: Last change:.
iab #!B #!/bin/bash
iab #d #define
iab #i #include

iab cb /********************************************************************
iab ce  ********************************************************************/
iab cc- /*-----------------------------------------------------------------*/
iab 79a- ------------------------------------------------------------------------------
iab 79a= ==============================================================================

iab wgetdl1 wget --no-check-certificate 
iab dmphtm r!w3m -dump -cols 74

iab viml "" vim: set ts=4 sts=2 sw=2 tw=0 ff=unix ft=txt fdm=marker wrap noai : 

iab ln10x8 12345678901234567890123456789012345678901234567890123456789012345678901234567890

"""" -----------------------------------------------------------------------
"" }}}

"""" -------
"""" Keymap {{{
"""" -------

"" Normal mode {{{
nmap ,, :e! ~/.vimrc
nmap ,. :source ~/.vimrc<CR>
nmap ,h :helptags $VIMRUNTIME/doc
" nmap ,m :e $VIMRUNTIME/lang/menu_ja_jp.utf-8.vim 
" $VIMRUNTIME/lang/menu_japanese_japan.932.vim
" $VIMRUNTIME/lang/menu_ja_jp.utf-8.vim 
"
nmap ,m :e $VIMRUNTIME/menu.vim


"""" Map For Plugin {{{

"" Open-browser https://github.com/tyru/open-browser.vim
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
"nmap gx <Plug>(openbrowser-open)
"vmap gx <Plug>(openbrowser-open)


"""" }}}

"" }}}

"" Insert mode {{{
"" 日付挿入 <C-D>の二回
imap <silent> <C-D><C-D> <C-R>=strftime("%Y/%m/%d")<CR>

"" 時間挿入 <C-T>の二回
imap <silent> <C-T><C-T> <C-R>=strftime("%H:%M:%S")<CR>
"" }}}




"""" }}}

"""" For Japanese {{{
"" vim 内部処理用の既定の文字コード
set encoding=utf-8
"" 自動判別エンコードの優先順位（JIS系の文字コードを先頭に記述する。内部処理用の既定のコード utf-8 は、最後にする。）
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

"" ２バイト文字と１バイト文字混在で文字がずれるの回避
set ambiwidth=double



"""" For Japanese IME ON/OFF on Linux {{{


"" * Vimで強制的にIMをオフにする @UbuntuB
" http://d.hatena.ne.jp/yuta84q/20090205/1233843890
" Requre:
" apt-get install xvkbd

"" <esc>か<C-[>が押されたらシステムにCtrl + Shift + Spaceを送る
"inoremap <silent> <esc> <esc>:call ForceImeOff()<cr>
"inoremap <silent> <C-[> <esc>:call ForceImeOff()<cr>
"function! ForceImeOff()
"	let imeoff = system('xvkbd -text "\[Control]\[Shift]\[space]" > /dev/null 2>&1')
"endfunction


"""" }}}

"""" }}}

"---------------------------------------------------------------------------
" Setting Edit 編集に関する設定:
"
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set noautoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set noshowmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
" --- .gvimrc --------------------
"" Font Setting:
" Font for Linux {{{
"set guifont=Takaoゴシック\ 14
"set guifontwide=Takaoゴシック\ 14
"set guifont=IPAゴシック\ 14
"set guifontwide=IPAゴシック\ 14

"set guifont=RictyDiminished\ 14 
"set guifontwide=RictyDiminished\ 14 
set guifont=Ricty\ 14 
set guifontwide=Ricty\ 14 


" }}} 

"" 列数・横
"set columns=72
set columns=80

"" 行数・縦
"set lines=28
set lines=24

" 行番号を表示 (number:表示)
set number

" ルーラーを表示 (noruler:非表示)
set ruler

" タブや改行を表示 (list:表示)
set nolist

" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap

" 常にステータス行を表示 (詳細は:he laststatus)
"set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
"set cmdheight=2
" コマンドをステータス行に表示
"set showcmd
" タイトルを表示
"set title

" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)



"" ---- Status line ----- {{{
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)

"" ステータスラインに表示される文字設定
" <URL:http://vimwiki.net/?'statusline'>
" <URL:http://sourceforge.jp/magazine/07/11/06/0151231>

"" 1. Status line {{{ 
" File Path  [+][FileEncode][FileFormat] Line, Column Percemt%
" set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" }}}

"" 2. Status line {{{
" {ファイルパス} [ファイルの状態] [文字コード,改行コード,ファイルタイプ]
" カーソル位置の文字情報 D_10進数;H_16進数 
" [L_行,C_列;P_比率%,LL_最終行] 
" (カーソル位置の文字情報 D_10進数,H_16進数 カーソル位置の%)
set statusline=%F%m%r%h%w\ [%{&fileencoding}\,%{&ff}\,%Y]\ D_%03.3b\;H_%02.2B\ [L_%04l,C_%04v\;P_%p%%,LL=%L\]
" }}}


" }}}

""" -----------------------------------------
"""  COLOR 
""" -----------------------------------------
" Red   LightRed  DarkRed
" Green LightGreen  DarkGreen SeaGreen
" Blue  LightBlue DarkBlue  SlateBlue
" Cyan  LightCyan DarkCyan
" Magenta LightMagenta  DarkMagenta
" Yellow  LightYellow Brown   DarkYellow
" Gray  LightGray DarkGray
" Black White
" Orange  Purple    Violet
" ---------------------------------------
"" 16 color test
" :so $VIMRUNTIME/syntax/colortest.vim

"" highlight color test 
" :so $VIMRUNTIME/syntax/hitest.vim

"" color schieme (/usr/share/vim/vim73/colors/)
" slate
"colorscheme ron

" [Default color schieme List]"
" :r ls -C /usr/share/vim/vim73/colors/
" delek.vim desert.vim elflord.vim evening.vim koehler.vim
" morning.vim murphy.vim pablo.vim peachpuff.vim ron.vim
" shine.vim slate.vim torte.vim zellner.vim blue.vim
" darkblue.vim default.vim

"""" ---------------------------------------
"""" カレント行ハイライトと色付け(vim7以降)
"""" ---------------------------------------
"" 横行 Line

"" // 横行 Cursor Line high light (+Ver.7)
"set nocursorline
set cursorline
highlight CursorLine guibg=Orange "Lightblue
highlight CursorLine guifg=Black
highlight CursorLine ctermbg=Black
highlight CursorLine ctermfg=Blue



"" // 縦列 Cursor Column high light (+Ver.7)
"set nocursorcolumn
"set cursorcolumn
"highlight CursorColumn ctermbg=Blue
"highlight CursorColumn ctermfg=Green

"---------------------------------------------------------------------------

" Setting File ファイル操作に関する設定: {{{
"
" backup バックアップ ファイルを作成しない
" (次行の先頭の " を削除すれば有効になる)
set nobackup

" swap スワップ ファイル なし
set noswapfile


"" undo file (v7.4以降){{{
" * Vimが変なファイルを作るようになった - KaoriYa
" http://www.kaoriya.net/blog/2014/03/30/
" undo ファイルは、ファイルを保存した時に同時に
" .{ファイル名}.un~ という形式で作成される。
" Vim が undo の情報をセッションを越えて保持するためのもの。

"" Save Dir for undo file 
":set undodir=~/.vim/undo

"" undo file 無効化する
set noundofile

""
"" 無視設定を追加する
"たとえば git であれば .gitignore に次のような一行を足すことで undo ファイルを無視できます。
" .*.un~
" }}}


" }}}

" Clipboard 関連の設定{{{
" * vimエディタからクリップボードを利用する。 名無しのvim使い
" http://nanasi.jp/articles/howto/editing/clipboard.html
" 1. ビジュアルモードで選択したテキストが、クリップボードに入るようにする。
" GUI版vimエディタで、この機能を有効にするなら、この設定を追加する。
:set guioptions+=a

" GUI版でない場合は、こちらの設定を追加する。
:set clipboard+=autoselect

" 2. yankしたテキストが無名レジスタだけでなく、*レジスタにも入るようにする。
" 無名レジスタに入るデータを、*レジスタにも入れる。
:set clipboard+=unnamed

" }}}

"" Help For Windows User private {{{
" Keep fenc = ucs-bom 
" * bomb(ucs-bomb)付きかの確認
" :set nobomb?
" * bombを付けない 付ける
" :set [no]bomb
"
" * DL Help Ja
" https://github.com/vim-jp/vimdoc-ja/archive/master.zip 

" 7.3.397よりも前のバージョンを利用している場合は日本語では検索できない場合もある
set helplang=ja,en

"" $VIMRUNTIME/doc/private
helptags ~/.vim/doc
"}}}

" ===========================================================
" Puppy Menu {{{
" /etc/xdg/templates/_root_.jwmrc 
" /root/.jwmrc-tray
" /usr/local/bin/defaulttexteditor
" }}}

" * Restore missing gvim menu bar under GNOME on Ubuntu {{{
" http://vim.wikia.com/wiki/Restore_missing_gvim_menu_bar_under_GNOME
" $ rm ~/.gnome2/Vim
" or Change "~/.gnome2/Vim"
"     [Placement]
"     Dock=Toolbar\\0,1,0,0\\Menubar\\0,0,0,0
" 
" $ rm ~/.gnome/Vim
" $ UBUNTU_MENUPROXY="" gvim 
" }}}

