#history
#unset HISTFILE

#completion
if [ -f /etc/bash_completion ]; then
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

#alias
alias ~='cd ~'
alias ..='cd ..'
alias ac='sudo apt-get autoremove --purge && sudo apt-get clean && dpkg -l |grep ^rc |awk "{print \$2}" |sudo xargs dpkg -P'
alias ad='sudo apt-get dist-upgrade'
alias ai='sudo apt-get install'
alias ap='sudo apt-get purge'
alias as='apt-cache search --names-only'
alias au='sudo apt-get update && sudo apt-get upgrade'
alias aw='apt-cache show'
alias bt='screen -t rtorrent rtorrent'
alias cr='ctags -R --fields=+lS && cscope -Rbq'
alias df='df -h'
alias dt='dmesg | tail -n 20'
alias du='du -sh'
alias ga='git add -A'
alias gc='git commit -a'
alias gd='git difftool'
alias gl='git log --graph'
alias gp='git push'
alias gs='git status'
alias gu='git pull'
alias hb='sudo pm-hibernate'
alias ht='sudo halt'
alias irc='screen -t irssi irssi'
alias la='ls -lA --color=auto'
alias lh='ls -lAh --color=auto'
alias ll='ls -l --color=auto'
alias mail='screen -t mutt mutt'
alias m='md5sum'
alias ntp='sudo ntpdate pool.ntp.org && sudo hwclock --systohc'
alias off='sudo poff'
alias on='sudo pon dsl-provider'
alias rb='sudo reboot'
alias sp='sudo pm-suspend'
alias sr='screen -R'
alias s='sha1sum'
alias x='startx'

#screen and xterm's dynamic title
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
