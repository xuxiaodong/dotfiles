#!/bin/sh
#
# Maintainer:    Xu Xiaodong <xxdlhy@gmail.com>
# Last modified: 14/05/10 14:55:03 

# apps

feh --bg-scale ~/pic/wallpapers/flow.png &
urxvtd -q -f -o
#xscreensaver -no-splash &
#numlockx &
#xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &
#pypanel &
#(sleep 2 && conky) &
#/home/xiaodong/.dropbox-dist/dropboxd &

# ime

export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim
fcitx &

# wm/de

#exec awesome
#exec i3 --force-xinerama -V > ~/.i3/i3.log 2>&1
exec i3 --force-xinerama
#exec openbox
