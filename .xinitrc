# umask
umask 022

# bell
xset b off

# screen saver
xset s off
xset dpms 0 0 0

# external monitor
monitor-toggle

# fcitx
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
fcitx &

# xmodmap
xmodmap ~/.xmodmaprc

# xresources
xrdb ~/.Xresources

# mpd
mpd &

# mra-guard
mra-guard &

# dropbox
dropboxd &

# xcompmgr
xcompmgr &

# touchpad
synclient TapButton1=1
syndaemon -i 1 -k -d &

# window manager
exec awesome
