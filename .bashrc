# umask
umask 022

# variable
export EDITOR=vim

# xon/xoff
[ -t 0 ] && stty -ixon

# history
export HISTSIZE=1024
export HISTFILESIZE=10240

# path
pathmunge () {
	case ":${PATH}:" in
		*:"$1":*)
			;;
		*)
			if [ "$2" = "after" ]
			then
				PATH=$PATH:$1
			else
				PATH=$1:$PATH
			fi
			;;
	esac
}

pathmunge /usr/lib/ccache

pathmunge $HOME/binary after
pathmunge $HOME/scripts after

export PATH

# colorful manual page
export GROFF_NO_SGR=1
export LESS_TERMCAP_mb=$'\E[05;34m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;34m'       # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[44;33m'       # begin standout-mode
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;33m'       # begin underline

# completion
if [ -f /etc/bash_completion ]
then
	. /etc/bash_completion
fi

_comp_all_packages()
{
	local cur
	COMPREPLY=()
	cur=`_get_cword`
	COMPREPLY=( $( apt-cache pkgnames $cur 2> /dev/null ) )
	return 0
}

_show_installed_packages()
{
	command grep -A 1 "Package: $1" /var/lib/dpkg/status | \
		command grep -B 1 -Ee "ok installed|half-installed|unpacked| \
		half-configured|config-files" -Ee "^Essential: yes" | \
		command grep "Package: $1" | cut -d\  -f2
}

_comp_installed_packages()
{
	local cur
	COMPREPLY=()
	cur=`_get_cword`
	COMPREPLY=( $( _show_installed_packages $cur ) )
	return 0
}

complete -F _comp_all_packages $default agi acw acp
complete -F _comp_installed_packages $default agp

# functions
calc() {
	echo "scale=4;""$*" | bc
}

wallpaper() {
	[ -f "$1" ] && ln -sf "$1" ~/.wallpaper

	hsetroot -fill ~/.wallpaper
}

# aliases
alias ..='cd ..'
alias ...='cd ../..'

alias acp='apt-cache policy'
alias acs='apt-cache search --names-only'
alias acw='apt-cache show'
alias agc='sudo apt-get autoremove --purge && sudo apt-get clean && dpkg -l |grep ^rc |awk "{print \$2}" |sudo xargs -r dpkg -P'
alias agd='sudo apt-get update && sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
alias agp='sudo apt-get purge'
alias agu='sudo apt-get upgrade'

alias la='ls -lAh --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'

alias suspend='systemctl suspend'
alias hibernate='systemctl hibernate'
alias hybrid-sleep='systemctl hybrid-sleep'

alias poweroff='sudo -k poweroff'
alias reboot='sudo -k reboot'

alias grep='grep --color=auto'
alias sort='LANG=C sort'

alias gct='ctags -R --fields=+lS && cscope -Rbq'
alias gpw='pwgen -Bcns 16 1'
alias ntp='sudo ntpdate pool.ntp.org && sudo hwclock --systohc'
alias sr='screen -D -R'
alias tm='tmux new-session -A -s 0'
alias x='exec startx'

# prompt string
PS1='\u@\h:\w\[\e[33m\]$(__git_ps1 "{%s}")\[\e[0m\]\$ '

# screen and xterm's dynamic title
[ -z "$SSH_TTY" ] && [ -z "$TMUX" ] && case $TERM in
	xterm*)
		# Set xterm's title
		TITLEBAR='\[\e]0;\u@\h:\w\a\]'
		export PS1="${TITLEBAR}${PS1}"
		;;
	screen*)
		# Use path as title
		PATHTITLE='\[\ek\W\e\\\]'
		# Use program name as title
		PROGRAMTITLE='\[\ek\e\\\]'
		export PS1="${PROGRAMTITLE}${PATHTITLE}${PS1}"
		;;
	*)
		;;
esac
