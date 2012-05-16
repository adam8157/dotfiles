# umask
umask 022

# bell
xset b off

# screen saver
xset s off
xset dpms 0 0 0

# xmodmap
#xmodmap ~/.xmodmaprc

# xresources
xrdb ~/.Xresources

# xcursor
xsetroot -cursor_name left_ptr

# fcitx
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
fcitx &

# conky
conky &

# dropbox
dropboxd &

# touchpad
synclient TapButton1=1
syndaemon -i 1 -k -d &

# window manager
exec awesome
