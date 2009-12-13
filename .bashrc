#history
#unset HISTFILE

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

_show_key()
{
	local cur
	COMPREPLY=()
	cur=`_get_cword`
    COMPREPLY=( $( compgen -W "$( gpg --list-keys 2>/dev/null | \
                sed -ne 's@^pub.*/\([^ ]*\).*$@\1@p;s@^.*\(<\([^>]*\)>\).*$@\2@p')" -- "$cur" ))
	return 0
}

complete -F _show_all $default ai aw
complete -F _show_installed $default ap
complete -F _show_key $default ge gi gs

#alias
alias ..='cd ..'
alias ac='sudo apt-get autoremove --purge && sudo apt-get clean && dpkg -l |grep ^rc |awk "{print \$2}" |sudo xargs dpkg -P'
alias ad='sudo apt-get dist-upgrade'
alias ai='sudo apt-get install'
alias ap='sudo apt-get purge'
alias as='apt-cache search --names-only'
alias au='sudo apt-get update && sudo apt-get upgrade'
alias aw='apt-cache show'
alias bt='rtorrent'
alias gc='git commit -a'
alias ge='gpg --edit-key'
alias gi='gpg --sign-key'
alias gp='git push'
alias gr='gpg --recv-keys'
alias gs='gpg --send-keys'
alias irc='irssi'
alias la='ls -A'
alias ll='ls -l'
alias m='md5sum'
alias ntp='sudo ntpdate pool.ntp.org && sudo hwclock --systohc'
alias off='sudo poff'
#alias off='drcomc logout'
alias on='sudo pon dsl-provider'
#alias on='sudo drcomd && drcomc login'
alias s='sha1sum'
alias sr='screen -R'
alias x='startx'
alias ~='cd ~'
