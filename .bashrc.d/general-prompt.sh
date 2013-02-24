# Colors
NoColor="\033[0m"
Cyan="\033[0;36m"
Green="\033[0;32m"
Red="\033[0;31m" 
Yellow="\033[0;33m"

# Chars
RootPrompt="\#\n"
NonRootPrompt="\$\n"

# Contextual prompt
prompt() {

	USERNAME=`whoami`
	HOSTNAME=`hostname -s`
	#CURRENTPATH=`pwd | sed "s|$HOME|~|g"`

	# Change the Window title
	WINDOWTITLE="$USERNAME@$HOSTNAME"
	echo -ne "\033]0;$WINDOWTITLE\007"

	# Change the dynamic prompt
	#LEFTPROMPT="$Yellow$CURRENTPATH"
	LEFTPROMPT="\[$Yellow\][\!][`date +"%Hh%Mm%Ss"`]\[$Cyan\]$USERNAME@$HOSTNAME":"\[$Yellow\] \w"

	## GIT
	GITSTATUS=$(git status 2> /dev/null)
	if [ $? -eq 0 ]; then
		#check igored directory
		GITSTATUS=$(git clean -xnd `pwd` | grep 'Would remove \./'> /dev/null)
		if [ $? -eq 1 ]; then
		    echo $GITSTATUS | grep "not staged" > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				LEFTPROMPT=$LEFTPROMPT"\[$Red\]"
			else
				LEFTPROMPT=$LEFTPROMPT"\[$Green\]"
			fi
			# BRANCH=`git describe --contains --all HEAD`
			BRANCH=`git rev-parse --abbrev-ref HEAD`
			LEFTPROMPT=$LEFTPROMPT" ["$BRANCH"]"
		fi
	fi



	## SVN
	RIGHTPROMPT=""
	let RIGHTSIZE=0
	if [ -d ".svn" ]; then
		SVNSTATUS=$(svn status 2>&1)
		echo $SVNSTATUS | grep 'not a working copy' 2>&1 > /dev/null
		if [ $? -eq 1 ]; then
			echo $SVNSTATUS | grep -P '^\s*[AMDCR]' 2>&1 > /dev/null
			if [ $? -eq 0 ]; then
				LEFTPROMPT=$LEFTPROMPT"\[$Red\]"
			else
				LEFTPROMPT=$LEFTPROMPT"\[$Green\]"
			fi
			BRANCH=$(svn info | grep 'Repository Root' | sed -r 's|^.*/([a-z]+)$|\1|')
			LEFTPROMPT=$LEFTPROMPT" ["$BRANCH"]"
			#RIGHTPROMPT=$RIGHTPROMPT"[SVN Repository $BRANCH]"
			#let RIGHTSIZE=$(echo -n "[SVN Repository $BRANCH]" | wc -c)
		fi
	fi
	# echo -e -n $LEFTPROMPT

	#USER / ROOT
	if [ $EUID -ne 0 ]; then
		PS1=$LEFTPROMPT"\[$NoColor\] "$NonRootPrompt""
	else
		PS1=$LEFTPROMPT"\[$NoColor\] "$RootPrompt""
	fi	
}

# Define PROMPT_COMMAND if not already defined (fix: Modifying title on SSH connections)
if [ -z "$PROMPT_COMMAND" ]; then
	case $TERM in
	xterm*)
		PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
	;;
	screen)
		PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
	;;
	esac
fi
 
# Main prompt
PROMPT_COMMAND="prompt;$PROMPT_COMMAND"
 
if [ $EUID -ne 0 ]; then
	PS1=$NonRootPrompt" "
else
	PS1=$RootPrompt" "
fi

