##################################################
#
# File:           .bash.profile
# Maintainer:     Xu Xiaodong <xxdlhy@gmail.com>
# Last modified:  04/02/11 16:49:43 
#
##################################################


. $HOME/.bashrc

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/vc/1 ]]; then
  startx
  logout
fi

export TERM=urxvt
export EDITOR=gvim
export BROWSER="firefox %s"
export PATH="/usr/lib/cw:$PATH"
