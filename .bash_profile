# bashrc
if [ -f ~/.bashrc ]
then
	. ~/.bashrc
fi

# startx
if [ "$(tty)" = "/dev/tty1" ] && [ -z "$DISPLAY" ]
then
	exec startx
fi
