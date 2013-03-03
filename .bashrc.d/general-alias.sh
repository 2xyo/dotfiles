##############################################################################
# qzerty / qwerty
alias qptitude='aptitude'

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

alias alert='notify-send -i /usr/share/icons/gnome/32x32/apps/gnome-terminal.png "[0] "'


alias ap='sudo aptitude update && sudo aptitude -y full-upgrade && sudo aptitude autoclean ; alert "Upgrade Done"'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

##############################################################################
# git


# une fonction pour commiter rapidement 
# http://sametmax.com/a-linterieur-de-mon-bashrc/
function commit {
    git commit -m "`echo "$*" | sed -e 's/^./\U&\E/g'`"
}
alias co=commit;


# ca c'est un truc de feignasse car je me souviens jamais comment extraire 
# en ligne de commande tel ou tel format
 
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
        exit 0
    fi
}
 
# ça date de http://sametmax.com/decompresser-sous-linux-en-ligne-de-commande/
 
# et quelques alias pour des tâches de tous les jours
 
