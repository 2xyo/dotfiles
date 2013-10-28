
##############################################################################
# SYSTEM
##############################################################################

alias la='ls -alF'
alias ll='ls -lF'
alias la='ls -alF'
alias ll='ls -lF'
alias l='ls -CF'


alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

alias qptitude='aptitude'
alias cqt='cat'

alias ap='sudo aptitude update && sudo aptitude -y full-upgrade && sudo aptitude autoclean ; alert "Upgrade Done"'

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}



extract () {
    if [ -f $1 ]
    then
        case $1 in
            (*.7z) 7z x $1 ;;
            (*.lzma) unlzma $1 ;;
            (*.rar) unrar x $1 ;;
            (*.tar) tar xvf $1 ;;
            (*.tar.bz2) tar xvjf $1 ;;
            (*.bz2) bunzip2 $1 ;;
            (*.tar.gz) tar xvzf $1 ;;
            (*.gz) gunzip $1 ;;
            (*.tar.xz) tar Jxvf $1 ;;
            (*.xz) xz -d $1 ;;
            (*.tbz2) tar xvjf $1 ;;
            (*.tgz) tar xvzf $1 ;;
            (*.zip) unzip $1 ;;
            (*.Z) uncompress ;;
            (*) echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "Error: '$1' is not a valid file!"
    fi
}
alias extract=extract


CCZE=$(which ccze)

if [ -f "$CCZE" ]; then

    logview ()
    {
        $CCZE -A < $1 | most
    }
    alias logview=logview


    logtail ()
    {
        tail -f $1 | $CCZE  
    }
    alias logtail=logtail

fi

alias curls="curl -v -A 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)' "

alias wgets='H="--header"; wget $H="Accept-Language: en-us,en;q=0.5" $H="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" $H="Connection: keep-alive" -U "Mozilla/5.0 (Windows NT 5.1; rv:10.0.2) Gecko/20100101 Firefox/10.0.2" --referer=http://www.google.com/ '



##############################################################################
# DESKTOP
##############################################################################

XCLIP=$(which xclip)
if [ -f "$XCLIP" ]; then
	alias pbcopy='$XCLIP -selection clipboard'
	alias pbpaste='$XCLIP -selection clipboard -o'
fi


NOTIFY=$(which notify-send)
if [ -f $NOTIFY ]; then
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi


if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    bash /usr/local/bin/virtualenvwrapper.sh
fi


##############################################################################
# DEV PYTHON
##############################################################################

notebook () {
    process="/usr/bin/python /usr/bin/ipython notebook --port 8889 --pprint"
    processes=$(pgrep -f "$process")
    if [ -z $processes ]
    then
        nohup ipython notebook --port 8889 --pprint 2&>1 >> /dev/null &
    else
        xdg-open http://127.0.0.1:8889
    fi
    echo ""
}
alias notebook=notebook

notebook_kill () {
    process="/usr/bin/python /usr/bin/ipython notebook --port 8889 --pprint"
    kill -9 $(pgrep -f "$process")
}
alias notebook_kill=notebook_kill


##############################################################################
# HOSTS
##############################################################################

if [  -d ~/.config/dotfiles/hosts  ]; then
    for DIR in ~/.config/dotfiles/hosts/*; do
        if [  -d "$DIR"  ]; then
            if test -e $DIR/alias.sh; then
                . $DIR/alias.sh
            fi
        fi
    done
fi