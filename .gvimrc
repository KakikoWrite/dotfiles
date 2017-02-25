"" vim: set ts=4 sts=2 sw=2 tw=0 ff=unix ft=vim fdm=marker wrap noai
" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
" ----
"  highlight Normal guibg=grey90
"  highlight Cursor guibg=Green guifg=NONE
"  highlight lCursor guibg=Cyan guifg=NONE
"  highlight NonText guibg=grey80
"  highlight Constant gui=NONE guibg=grey95
"  highlight Special gui=NONE guibg=grey95

"" 背景をBlack系にした場合
  highlight Normal guibg=black
  highlight Cursor guibg=Green guifg=NONE
  highlight lCursor guibg=Cyan guifg=NONE
  highlight NonText guibg=black
  highlight Constant gui=NONE guibg=grey10
  highlight Special gui=NONE guibg=grey95

endif

"""" GUI固有の設定 {{{
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




"""" Font Setting (GUI ONLY):
"" For Unix {{{
""
"" * Fonts dir ubuntu {{{ 
"" User: ~/.fonts/
"" AllUsers: /usr/local/share/fonts/
"" }}}

"set guifont=Takaoゴシック\ 14
"set guifontwide=Takaoゴシック\ 14

"set guifont=IPAゴシック\ 14
"set guifontwide=IPAゴシック\ 14

set guifont=Ricty\ 14 
set guifontwide=Ricty\ 14 
"set guifont=Ricty\ Diminished\ 14
"set guifontwide=Ricty\ Diminished\ 14




"" }}}

" }}}

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





