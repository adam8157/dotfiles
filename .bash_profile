# bashrc
if [ -f ~/.bashrc ]
then
	. ~/.bashrc
fi

# mpd
if [ $(tty) == "/dev/tty1" ]
then
	start-daemon mpd
fi

# offlineimap
if [ $(tty) == "/dev/tty1" ]
then
	start-daemon offlineimap -l .offlineimap/log
fi

# startx
if [ -z "$DISPLAY" ] && [ $(tty) == "/dev/tty1" ]
then
	startx
fi
