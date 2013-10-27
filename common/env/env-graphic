#/usr/bin/env sh

# change default editor
for EDI in "/opt/sublime_text/sublime_text" "$VIM" "$VI"
do
	if [ -f ~/.pythonrc ]; then
		export EDITOR="$EDI -w"
		export GIT_EDITOR='$EDI -w'
		break
	fi
done