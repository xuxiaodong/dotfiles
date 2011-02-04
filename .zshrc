##################################################
#
# File:           .zshrc
# Maintainer:     Xu Xiaodong <xxdlhy@gmail.com>
# Last modified:  04/02/11 16:49:43 
#
##################################################


# 命令提示符
PROMPT='%{[36m%}%n%{[35m%}@%{[34m%}%M:%l 
%{[32m%}%~/ %{[31m%}%% %{[m%}'

# 历史记录
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory
setopt INC_APPEND_HISTORY
#setopt hist_ignore_all_dups
setopt hist_ignore_space

limit coredumpsize 0

# 按键
set -o emacs
#bindkey -v
bindkey "\e[3~" delete-char
bindkey '\C-w' kill-region
bindkey -s '\C-xp' 'mplayer '

WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

# 自动补全
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

autoload -U compinit 
compinit

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu no select
zstyle ':completion:*:*:default' force-list always

# GNU Colors
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
#zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

setopt extendedglob

# MIME system
autoload -U zsh-mime-setup
zsh-mime-setup

# 命令别名
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias ls='ls -F --color=auto'
alias ll='ls -lsh'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
#alias man='TERMINFO=~/.terminfo/ LESS=C TERM=mostlike PAGER=less man'
#alias x='startx'
#alias p='pho -p'
alias vu='VBoxManage startvm Ubuntu --type sdl'
alias vw='VBoxManage startvm WinXP --type sdl'
alias op='optipng -o7'
#alias mydate='date "+Today is %x, day number %j of %Y."'
#alias m="pgrep mlnet >/dev/null 2>&1 && echo vd | nc -q 1 localhost 4000 |python -c \"import re,sys; str=sys.stdin.read();a=re.compile('.*?\[D\s*(.*?)\].*mldonkey (.*?)[\s*](\d.*?)[\s*](\d.*?)[\s*](\d.*?)[\s*](\d.*?)[\s*](\d.*?)[\s*](\d.*?)[\s*]([\d|-].*?)[\s|\n]').findall(str);b=[(name.strip(), p.strip(), cs.strip(), ts.strip(), spd.strip()) for id, name, p, cs, ts, sn, old, act, spd in a]; map(lambda (n, p, cs, ts, spd): sys.stdout.write('(%s%%)%s...%s\t %s/%s\t %skb/s\n' % (p, n[:20], n[-8:], cs, ts, spd)), b);print ''\""
#alias m='pgrep mlnet >/dev/null 2>&1 && echo vd | nc -q 1 localhost 4000 | awk '"'"'/\[D/{print "\033[0;32m"$7"\t\033[4;31m"$8"%\033[0m\t",$14"KB/s"} /Down:/'"'"
alias e='emacs -nw'
alias cam='mplayer tv:// -tv driver=v4l2:width=320:height=240:outfmt=rgb24:device=/dev/video0'
alias rcam='mencoder tv:// -tv driver=v4l2:width=320:height=240:device=/dev/video0 -nosound -ovc lavc -o demo.avi'
alias tcam='mplayer tv:// -tv driver=v4l2:width=640:height=480:outfmt=rgb24:device=/dev/video0'
alias smtp='/usr/sbin/ssmtp -C.ssmtp/ssmtp.conf -oA.ssmtp/revaliases'
alias d='sdcv'

alias pf='perldoc -f'
alias pv='perldoc -v'

alias -s pdf=apvlv
alias -s jpg=pho
alias -s png=pho
alias -s avi=mplayer
alias -s mkv=mplayer

alias pw="perl -le 'print map { chr rand(94) + 33 } 1..16';"

# 路径别名
hash -d OB="$HOME/.config/openbox/"
hash -d AW="$HOME/.config/awesome/"

CDPATH="$HOME/.config:$HOME/.config/uzbl"

# 搜索路径
export PATH="/usr/lib/cw:$PATH:$HOME/bin"

# OOo
export OOO_FORCE_DESKTOP=gnome

# Java
export AWT_TOOLKIT=MToolkit
export LIBXCB_ALLOW_SLOPPY_LOCK=1

# Wink
export WINK_INSTALL_DIR=/opt/wink

# Firefox
export MOZ_DISABLE_PANGO=1

# Man pages
#export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
#export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
#export LESS_TERMCAP_me=$'\E[0m'          # end mode
#export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode                 
#export LESS_TERMCAP_so=$'\E[01;44;33m'   # begin standout-mode - info box                              
#export LESS_TERMCAP_ue=$'\E[0m'          # end underline
#export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline

# Editor
#export EDITOR=vim

# PAGER 
export PAGER=~/bin/vimpager
#alias less=$PAGER
#export MANPAGER="/usr/bin/most -s"

#if [ "$TERM" != "screen" ]; then
#    #screen -D -R
#    #Update 2008 Dec 16: -xRR is way better
#    screen -xRR
#fi 

#if [ "$TERM" == "emacs" ]; then
#	stty -echo nl
#fi

# Zenburn for the Linux console
if [ "$TERM" = "linux" ]; then
    #3f3f3f is problematic on a non-256color terminal
    echo -en "\e]P01e2320" #zen-black (norm. black)
    echo -en "\e]P8709080" #zen-bright-black (norm. darkgrey)
    echo -en "\e]P1705050" #zen-red (norm. darkred)
    echo -en "\e]P9dca3a3" #zen-bright-red (norm. red)
    echo -en "\e]P260b48a" #zen-green (norm. darkgreen)
    echo -en "\e]PAc3bf9f" #zen-bright-green (norm. green)
    echo -en "\e]P3dfaf8f" #zen-yellow (norm. brown)
    echo -en "\e]PBf0dfaf" #zen-bright-yellow (norm. yellow)
    echo -en "\e]P4506070" #zen-blue (norm. darkblue)
    echo -en "\e]PC94bff3" #zen-bright-blue (norm. blue)
    echo -en "\e]P5dc8cc3" #zen-purple (norm. darkmagenta)
    echo -en "\e]PDec93d3" #zen-bright-purple (norm. magenta)
    echo -en "\e]P68cd0d3" #zen-cyan (norm. darkcyan)
    echo -en "\e]PE93e0e3" #zen-bright-cyan (norm. cyan)
    echo -en "\e]P7dcdccc" #zen-white (norm. lightgrey)
    echo -en "\e]PFffffff" #zen-bright-white (norm. white)
    # avoid artefacts
    clear
fi

# SSH hosts tab completion
# See also: http://en.gentoo-wiki.com/wiki/Zsh
#local _myhosts
#_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
#zstyle ':completion:*' hosts $_myhosts

# Colorize STDERR
#exec 2>>(while read line; do
#  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)

# Setting Screen title
#preexec () {
#    echo -ne "\ek${1%% *}\e\\"
#}

## display fancy terminal title
#case $TERM in
#  *xterm*|(u)rxvt|(u|dt|k|E)term)
  ## display user@host and full dir in *term title
#  precmd () {
#    print -Pn "\033]0;%n@%m: %~ (%l)\007"
    #print -Pn "\033]0;%n@%m%# %~ %l %w :: %T\a" ## or use this
#    }
  ## display user@host and name of current process in *term title
#  preexec () {
#    print -Pn "\033]0;%n@%m <$1> %~ (%l)\007"
    #print -Pn "\033]0;%n@%m%# <$1> %~ %l %w :: %T\a" ## or use this
#    }
#  ;;
#esac
