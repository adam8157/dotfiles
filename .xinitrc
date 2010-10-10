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

#xmodmap
#xmodmap ~/.xmodmaprc

#xresources
xrdb ~/.Xresources

#conky
conky &

WINDOW_MANAGER=awesome
#WINDOW_MANAGER=openbox

if [ "$WINDOW_MANAGER" = "awesome" ]
then
    #cursor
    #sleep 5 && xsetroot -cursor_name left_ptr &

    #awesome
    exec awesome
elif [ "$WINDOW_MANAGER" = "openbox" ]
then
    #wallpaper
    hsetroot -fill ~/.Wallpaper

    #tint2
    tint2 &

    #openbox
    exec openbox
fi
