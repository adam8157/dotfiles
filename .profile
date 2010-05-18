#umask
umask 077

#variable
export EDITOR=vim
export PATH="$PATH:/home/adam/Scripts"

#bashrc
if [ -f ~/.bashrc ];then
	. ~/.bashrc
fi

#mpd
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
	mpd &
fi

#auto start X
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
	startx
fi
