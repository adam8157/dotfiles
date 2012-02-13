# history
#unset HISTFILE

# umask
umask 022

# xon/xoff
stty -ixon

# variable
export EDITOR=vim

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

pathmunge $HOME/Binary after
pathmunge $HOME/Scripts after

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

_show_all()
{
	local cur
	COMPREPLY=()
	cur=`_get_cword`
	COMPREPLY=( $( apt-cache pkgnames $cur 2> /dev/null ) )
	return 0
}

_show_installed()
{
	local cur
	COMPREPLY=()
	cur=`_get_cword`
	COMPREPLY=( $( _comp_dpkg_installed_packages $cur ) )
	return 0
}

complete -F _show_all $default ai aw
complete -F _show_installed $default ap

# alias
alias ~='cd ~'
alias ..='cd ..'
alias ac='sudo apt-get autoremove --purge && sudo apt-get clean && dpkg -l |grep ^rc |awk "{print \$2}" |sudo xargs dpkg -P'
alias ad='sudo apt-get update && sudo apt-get dist-upgrade'
alias ai='sudo apt-get install'
alias ap='sudo apt-get purge'
alias as='apt-cache search --names-only'
alias au='sudo apt-get upgrade'
alias aw='apt-cache show'
alias cr='ctags -R --fields=+lS && cscope -Rbq'
alias df='df -h'
alias dt='dmesg | tail -n 20'
alias du='du -sh'
alias dx='xset s off && xset dpms 0 0 0'
alias ga='git add -A'
alias gc='git commit -a'
alias gd='git difftool'
alias gi='git add -i'
alias gl='git log --graph'
alias gp='git push'
alias grep='grep --color=auto'
alias gr='git ls-files -d |xargs git checkout --'
alias gs='git status'
alias gu='git pull'
alias gw='git show'
alias hb='sudo pm-hibernate'
alias ht='sudo halt -p'
alias la='ls -lA --color=auto'
alias lh='ls -lAh --color=auto'
alias ll='ls -l --color=auto'
alias m='md5sum'
alias ntp='sudo ntpdate pool.ntp.org && sudo hwclock --systohc'
alias off='sudo poff'
alias on='sudo pon dsl-provider'
alias rb='sudo reboot'
alias sp='sudo pm-suspend'
alias sr='screen -R'
alias s='sha1sum'
alias x='startx'

# screen and xterm's dynamic title
case $TERM in
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
