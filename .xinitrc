#umask
umask 077

#xset
xset s off
xset dpms 0 0 0

#ibus
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
ibus-daemon -x -r -d

#xresources
xrdb -load ~/.Xresources

#conky
conky &

#wallpaper
#hsetroot -fill ~/.Wallpaper

#tint2
#tint2 &

#openbox
#exec openbox

#awesome
exec awesome
