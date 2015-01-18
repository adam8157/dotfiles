# umask
umask 022

# x bell
xset b off

# screen saver
xset s off
xset dpms 0 0 0

# xresources
xrdb ~/.Xresources

# external monitor
monitor-toggle

# fcitx
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
fcitx &

# xmodmap
xmodmap ~/.xmodmaprc

# touchpad
synclient TapButton1=1
syndaemon -i 1 -k -d

# mpd
mpd

# mra-guard
mra-guard &

# dropbox
dropboxd &

# compositor
compton &

# window manager
exec awesome
