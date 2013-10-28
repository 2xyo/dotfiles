# env already loaded
[  "$ENV_LOADED"  =  true  ] && return 0


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# change default pager
export PAGER=`which most`
export PAGER=${PAGER:-less}


# change default editor

SB="/opt/sublime_text/sublime_text -w"
VIM=$(which vim)
VI=$(which vi)

if [ -z $XDG_CURRENT_DESKTOP ]; then
    SB=/dontexist
fi

for EDI in "$SB" "$VIM" "$VI"
do
	if [ -f "$EDI" ]; then
		export EDITOR="$EDI"
		export GIT_EDITOR="$EDI"
		break
	fi
done



# Add PYTHONSTARTUP
if [ -f ~/.pythonrc ]; then
	export PYTHONSTARTUP=~/.pythonrc
fi


# virtualenv wrapper
if [ -d "$HOME/.virtualenvs" ] ; then
    export WORKON_HOME=~/.virtualenvs
    


    # The variable PROJECT_HOME tells virtualenvwrapper where to place your project working directories. 
	if [ -d "$HOME/projects" ] ; then
	    export PROJECT_HOME=$HOME/projects
	fi    
fi


# pyenv https://github.com/yyuu/pyenv
if [ -d "$HOME/.pyenv" ] ; then
    export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
fi


# Don't check mail when opening terminal.
unset MAILCHECK



if [  -d ~/.config/dotfiles/hosts  ]; then
    for DIR in ~/.config/dotfiles/hosts/*; do
        if [  -d "$DIR"  ]; then
            if test -e $DIR/env.sh; then
                . $DIR/env.sh
            fi
        fi
    done
fi


export ENV_LOADED=true
