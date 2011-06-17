#clear the screen

if [ "$SHLVL" = 1 ]; then
	[ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q \
		|| /usr/bin/clear
fi
