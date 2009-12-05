#history
unset HISTFILE

#completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

_show_installed()
{
	local cur
	COMPREPLY=()
	cur=`_get_cword`
	COMPREPLY=( $( _comp_dpkg_installed_packages $cur ) )
	return 0
}

_show_all()
{
	local cur
	COMPREPLY=()
	cur=`_get_cword`
	COMPREPLY=( $( apt-cache pkgnames $cur 2> /dev/null ) )
	return 0
}

complete -F _show_all $default ai aw
complete -F _show_installed $default ap

#alias
alias ..='cd ..'
alias ac='sudo apt-get autoremove --purge && sudo apt-get clean'
alias ad='sudo apt-get dist-upgrade'
alias ai='sudo apt-get install'
alias ap='sudo apt-get purge'
alias as='apt-cache search --names-only'
alias au='sudo apt-get update && sudo apt-get upgrade'
alias aw='apt-cache show'
alias bt='rtorrent'
alias dc='dpkg -l |grep ^rc |awk "{print \$2}" |sudo xargs dpkg -P'
#alias dial='sudo drcomd && drcomc login'
alias dial='sudo pon dsl-provider'
#alias hung='drcomc logout'
alias hung='sudo poff'
alias irc='irssi'
alias la='ls -A'
alias ll='ls -l'
alias ntp='sudo ntpdate pool.ntp.org && sudo hwclock --systohc'
alias sr='screen -R'
alias x='startx'
alias ~='cd ~'
