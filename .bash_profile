# PATH:~/.bash_profile
# Editor: Sato Tomohiko 佐藤　智彦
# Last change: 2017/02/23 15:19:59.
##----
## If exsist ~/.bashrc then open the file.
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

PATH=$PATH:~/bin
export EDITOR=vim

## Lynx BROWSER ( DEFAULT: /etc/lynx/lynx.cfg ) 
LYNX_CFG=~/.lynx/lynx.cfg; export LYNX_CFG


