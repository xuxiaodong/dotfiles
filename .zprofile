##################################################
#
# File:           .zprofile
# Maintainer:     Xu Xiaodong <xxdlhy@gmail.com>
# Last modified:  04/02/11 16:49:43 
#
##################################################


. $HOME/.zshrc

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
  logout
fi
