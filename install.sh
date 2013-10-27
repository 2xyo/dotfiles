#/usr/bin/env sh
set -x


contains()
{
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}


installOrUpdateSubtree()
{
	# 1 name 
	# 2 path
	# 3 url
	if ! contains "$(git branch -a)" "$1"
	then
		git remote add -f $1 $3
	else
		git fetch $1 master
	fi
	
	if [ ! -d "$2" ]
	then
		git subtree add --prefix $2 $1 master --squash
	else
		git subtree pull --prefix $2 $1 master --squash
	fi
}

installOrUpdateSubtree bash-it common/bash/bash-it  https://github.com/revans/bash-it.git 
installOrUpdateSubtree oh-my-zsh common/zsh/oh-my-zsh https://github.com/robbyrussell/oh-my-zsh.git 
installOrUpdateSubtree vim-pathogen common/vim/plugins/vim-pathogen https://github.com/tpope/vim-pathogen.git


echo "chsh -s $(which bash) r $(which zsh)"
