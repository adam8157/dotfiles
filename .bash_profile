# bashrc
if [ -f ~/.bashrc ]
then
	. ~/.bashrc
fi

# daemon
if [ "$(tty)" = "/dev/tty1" ]
then
	start-daemon mpd

	start-daemon mra-guard
fi

# startx
if [ "$(tty)" = "/dev/tty1" ] && [ -z "$DISPLAY" ]
then
	exec startx
fi
