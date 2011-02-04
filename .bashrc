##################################################
#
# File:           .bashrc
# Maintainer:     Xu Xiaodong <xxdlhy@gmail.com>
# Last modified:  04/02/11 16:49:43 
#
##################################################


[ -z "$PS1" ] && return

liBlack="\[\033[0;30m\]"
boBlack="\[\033[1;30m\]"
liRed="\[\033[0;31m\]"
boRed="\[\033[1;31m\]"
liGreen="\[\033[0;32m\]"
boGreen="\[\033[1;32m\]"
liYellow="\[\033[0;33m\]"
boYellow="\[\033[1;33m\]"
liBlue="\[\033[0;34m\]"
boBlue="\[\033[1;34m\]"
liMagenta="\[\033[0;35m\]"
boMagenta="\[\033[1;35m\]"
liCyan="\[\033[0;36m\]"
boCyan="\[\033[1;36m\]"
liWhite="\[\033[0;37m\]"
boWhite="\[\033[1;37m\]"

PS1="\n$boGreen\u$boBlack@$boBlue\h $liYellow{\[\`let exitstatus=\$? ; if [[ \${exitstatus} != 0 ]] ; then echo \"\${exitstatus}\" ; else echo "0" ; fi\`\]} \n$boWhite\w/ > $liWhite"

#PS1="\[\e[1;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]$(formattedGitBranch) \[\e[1;32m\]\$ \[\e[m\]\[\e[0m\]"

#PS1='[\u@\h \W]\$ '

if [ "$TERM" != "dumb" ]; then
#eval "`dircolors -b ~/.dircolors`"
alias ls='ls -F --color=auto'
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#export PATH=$PATH:/home/xiaodong/bin/
export CDPATH=".:~:/usr"

export OOO_FORCE_DESKTOP=gnome

export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim

alias df='df -h'
alias euw='emerge -Dup world'
alias elu='(emerge --sync; layman -S) && emerge -avuND world && localepurge'
alias ed='eclean-dist -d'

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

# Setting Screen title
case "$TERM" in
    screen)
        set -o functrace
        trap 'echo -ne "\ek\$:${BASH_COMMAND:0:20}\e\\"' DEBUG
        export PS1='\[\033k$:\W\033\\\]\u@\h:\w\$ '
    ;;
    *)
    ;;
esac

#function formattedGitBranch {
#    checkDir="$PWD"
#
#    # check whether we''re in a git repository
#    while [[ "$checkDir" != "/" ]]; do
#        if [[ -d "$checkDir/.git" ]]; then
#            echo -n -e " @\e[0;32m"
#            GIT_DIR="$checkDir/.git" git branch \
#                | grep "^\*" | sed -e "s/^\*//"
#            return 0
#        fi
#        checkDir=$(readlink -f "$checkDir/..")
#    done
#
#    return 1
#}

# mkdir, cd into it
mkcd () {
    mkdir -p "$*"
    cd "$*"
}

# Man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
