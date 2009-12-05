#clear the screen

if [ "$SHLVL" = 1 ]
then
	if [ -x /usr/bin/clear_console ]
	then
		/usr/bin/clear_console -q
	else
		/usr/bin/clear
	fi
fi
