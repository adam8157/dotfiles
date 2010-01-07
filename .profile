#umask
umask 077

#variable
export EDITOR=vim
export PATH="$PATH:/home/adam/Scripts:/home/adam/Projects/Arm/arm-linux-gcc/bin"

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
