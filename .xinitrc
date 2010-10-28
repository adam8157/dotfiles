#umask
umask 077

#xset
xset s off
xset dpms 0 0 0

#ibus
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
ibus-daemon -x -r -d &

#xmodmap
#xmodmap ~/.xmodmaprc

#xresources
xrdb ~/.Xresources

#conky
conky &

#touchpad
synclient TapButton1=1
syndaemon -i 1 -k -d &

#window manager
if [ "$WM" == "openbox" ]
then
    #wallpaper
    hsetroot -fill ~/.Wallpaper

    #tint2
    tint2 &

    #openbox
    exec openbox
else
    #cursor
    xsetroot -cursor_name left_ptr

    #awesome
    exec awesome
fi
