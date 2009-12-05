# bashrc
if [ -f ~/.bashrc ]
then
	. ~/.bashrc
fi

# daemon and X
if [ "$(tty)" = "/dev/tty1" ]
then
	start-daemon mpd

	start-daemon mra-guard

	[ -z "$DISPLAY" ] && startx
fi
