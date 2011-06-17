#bashrc
if [ -f ~/.bashrc ];then
	. ~/.bashrc
fi

#mpd
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
	mpd &
fi

#startx
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
	startx
fi
