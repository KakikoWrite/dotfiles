# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Author: Sato Tomohiko.
# Last change: 2017/02/25 11:35:46.

# * Ubuntuの英語環境をCUIにて日本語対応にする
# http://jlinuxer.dip.jp/?p=551

# * Linux/Console - matoken's wiki.
# http://hpv.cc/~maty/pukiwiki1/index.php?Linux%2FConsole

# * Font Ricty diminished
# http://www.rs.tus.ac.jp/yyusa/ricty_diminished.html

#### Add to ~/.bash_profile {{{
## $TERM
#export TERM=xterm
export TERM=xterm-256color

## $DISPLAY
export DISPLAY=:0.0

## For English {{{
# export LANG=C; export LC_ALL=C
## }}}

## For Japanese (utf-8) {{{
export LANG=ja_JP.UTF-8
export LC_MESSAGES=ja_JP.UTF-8
export LC_IDENTIFICATION=ja_JP.UTF-8
export LC_COLLATE=ja_JP.UTF-8
export LC_MEASUREMENT=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_TIME=ja_JP.UTF-8
export LC_NAME=ja_JP.UTF-8
# }}}
#### }}}


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ## fortune | cowsay {{{ 
    if [ -x /usr/games/cowsay -a -x /usr/games/fortune ]; then
      /usr/games/fortune | /usr/games/cowsay
    fi
    ## }}}
    ;;
linux*)

### Set GRUB_CMDLINE_LINUX_DEFAULT {{{
## 1. Edit /etc/default/grub
##   GRUB_CMDLINE_LINUX_DEFAULT="quiet splash VGA=279"
##   GRUB_CMDLINE_LINUX_DEFAULT="text VGA=279"
## 2. Run 'update-grub'
## }}}

### Run fbterm ( ~/.fbtermrc )
## for 256 color
if [ -n "$FBTERM" -a "$FBTERM" != "0" ]; then
    export TERM='fbterm'
fi
#    fbterm --vesa-mode=list
#    fbterm -- uim-fep -u anthy-utf8
	  fbterm -i fcitx-fbterm
	  echo Fbterm v 1.7. fcitx-fbterm [Alt]+F7: Change to GUI. 

    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'



#-------------------------------------------------------------
# alias
#-------------------------------------------------------------
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias mkdir='mkdir -p'
alias whis='whereis'

alias eng='export LANG=C; export LC_ALL=C'
alias jajp='export LANG=ja_JP.UTF-8; export LC_ALL=ja_JP.UTF-8'

alias pager='lv -Ou8'

alias kterm='kterm -sb -fg white -bg black &'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#-------------------------------------------------------------
## Color {{{
#-------------------------------------------------------------
## RGB: /usr/share/X11/rgb.txt
#0;30m   Black
#0;31m   Red
#0;32m   Green
#0;33m   Yellow
#0;34m   Blue
#0;35m   Purple
#0;36m   Cyan
#0;37m   White
## }}}


## PROMPT {{{
# \d	日付表示（曜日, 月 , 日）
# \D{format}	時間表示。システムコール strfttime(3)のフォーマット文字列で指定
# \h	ホスト名（ドメインパートを含まない）
# \H	ホスト名
# \j	バックグラウンドで起動しているジョブの数
# \l	仮想端末の番号（pts/0, pts/1などの数字）
# \n	改行(LF)
# \r	改行(CR)
# \s	シェル名(bash)
# \t	時刻表示（24時間表示 HH:MM:SS)
# \T	時刻表示（12時間表示 HH:MM:SS）
# \@	時刻表示（12時間表示 HH:MM AM/PM）
# \A	時刻表示（24時間表示 HH:MM）
# \u	ユーザ名
# \v	bashのバージョン
# \V	bashのバージョン（パッチレベル含む）
# \w	現在の作業ディレクトリ（フルパス表示）
# \W	現在の作業ディレクトリ（現在のディレクトリ名のみ表示）
# \!	history上の番号
# \#	bashが起動してからのコマンド番号
# \$	rootの場合には、# となり、それ以外のユーザでは $ となる
# \nnn	8進数での文字指定（nは数字）
# \\	\そのもの
# \[	ターミナル操作用のシーケンス文字列の開始
# \]	ターミナル操作用のシーケンス文字列の終了
# }}}


export PS1='\[\e[1;37m\](\[\e[1;32m\]\D{%F %T} \[\e[1;36m\]\d \[\e[1;33m\]\u @ \[\e[1;35m\]\h\[\e[1;37m\]): \l, \s Ver.\v\n\[\e[1;31m\]\w\[\e[1;37m\]:\$'


#-------------------------------------------------------------
# File & strings related functions:
#-------------------------------------------------------------


# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe() { find . -type f -iname '*'"${1:-}"'*' \
-exec ${2:-file} {} \;  ; }

#  Find a pattern in a set of files and highlight them:
#+ (needs a recent version of egrep).
function fstr()
{
    OPTIND=1
    local mycase=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
           i) mycase="-i " ;;
           *) echo "$usage"; return ;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
xargs -0 egrep --color=always -sn ${case} "$1" 2>&- | more

}


function swap()
{ # Swap 2 filenames around, if they exist (from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}


# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}


#-------------------------------------------------------------
## Reference:
# * bashrc sample
# http://tldp.org/LDP/abs/html/sample-bashrc.html
#
# * Linuxで、bash プロンプトを素敵で実用的なものに変更する
# https://jp.linux.com/news/linuxcom-exclusive/416957-lco20140519

