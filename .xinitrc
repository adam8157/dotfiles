# umask
umask 022

# bell
xset b off

# screen saver
xset s off
xset dpms 0 0 0

# ibus
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
ibus-daemon -x -r -d &

# xmodmap
#xmodmap ~/.xmodmaprc

# xresources
xrdb ~/.Xresources

# xcursor
xsetroot -cursor_name left_ptr

# conky
conky &

# dropbox
dropboxd &

# touchpad
synclient TapButton1=1
syndaemon -i 1 -k -d &

# window manager
exec awesome
