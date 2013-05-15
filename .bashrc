# umask
umask 022

# variable
export EDITOR=vim

# xon/xoff
[ -t 0 ] && stty -ixon

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

complete -F _comp_all_packages $default ai aw
complete -F _comp_installed_packages $default ap

# alias
alias ..='cd ..'
alias ac='sudo apt-get autoremove --purge && sudo apt-get clean && dpkg -l |grep ^rc |awk "{print \$2}" |sudo xargs dpkg -P'
alias ad='sudo apt-get update && sudo apt-get dist-upgrade'
alias ai='sudo apt-get install'
alias ap='sudo apt-get purge'
alias as='apt-cache search --names-only'
alias au='sudo apt-get upgrade'
alias aw='apt-cache show'
alias ct='ctags -R --fields=+lS && cscope -Rbq'
alias ga='git add -A'
alias gc='git commit -a'
alias gd='git difftool'
alias gl='git log'
alias gp='git push'
alias grep='grep --color=auto'
alias gr='git ls-files -d |xargs git checkout --'
alias gs='git status'
alias gu='git pull'
alias gw='git show'
alias la='ls -lAh --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias ntp='sudo ntpdate pool.ntp.org && sudo hwclock --systohc'
alias poweroff='sudo -k poweroff'
alias pt='find . -name \*.py -exec ptags {} \+'
alias pw='pwgen -Bcns 16 1'
alias reboot='sudo -k reboot'
alias sr='screen -R'

# screen and xterm's dynamic title
[ -z "$SSH_TTY" ] && case $TERM in
	xterm*)
		# Set xterm's title
		TITLEBAR='\[\e]0;\u@\h:\w\a\]'
		PS1="${TITLEBAR}${PS1}"
		;;
	screen*)
		# Use path as title
		PATHTITLE='\[\ek\W\e\\\]'
		# Use program name as title
		PROGRAMTITLE='\[\ek\e\\\]'
		PS1="${PROGRAMTITLE}${PATHTITLE}${PS1}"
		;;
	*)
		;;
esac
