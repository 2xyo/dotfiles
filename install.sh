#/usr/bin/env sh
#set -x

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
		echo "Add branch $1 "
		git remote add -f $1 $3
	else
		echo "Fetch branch $1"
		git fetch $1 master
	fi
	
	if [ ! -d "$2" ]
	then
		git subtree add --prefix $2 $1 master --squash
	else
		git subtree pull --prefix $2 $1 master --squash
	fi
}

linkCommonFile()
{
	# 1 dotfile
	# 2 destination
	ln -fs ${PWD}/common/$1 ~/$2
}

installBash()
{
	installOrUpdateSubtree bash-it common/bash/bash-it  https://github.com/revans/bash-it.git 
	linkCommonFile bash/bash-it .bash_it
	echo "N/none/none/none"
	$HOME/.bash_it/install.sh
	linkCommonFile bash/custom/bash_profile .bash_profile
	linkCommonFile bash/custom/bashrc .bashrc
}

installZsh()
{
	installOrUpdateSubtree oh-my-zsh common/zsh/oh-my-zsh https://github.com/robbyrussell/oh-my-zsh.git
	linkCommonFile zsh/oh-my-zsh .oh-my-zsh
	linkCommonFile zsh/custom/zshrc .zshrc
}

installVim()
{
	installOrUpdateSubtree vim-pathogen common/vim/plugins/vim-pathogen https://github.com/tpope/vim-pathogen.git
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	linkCommonFile vim/plugins/vim-pathogen/autoload/pathogen.vim .vim/autoload/pathogen.vim
	linkCommonFile vim/vimrc .vimrc
}

installPython()
{
	linkCommonFile python/pythonrc .pythonrc
}

installGit()
{
	linkCommonFile git/gitconfig .gitconfig
}

installHg()
{
	linkCommonFile hg/hgrc .hgrc
}

installGdb()
{
	installOrUpdateSubtree Gdbinit common/gdb/Gdbinit https://github.com/gdbinit/Gdbinit.git
	linkCommonFile gdb/Gdbinit/gdbinit .gdbinit
}

installEnv()
{
	linkCommonFile env/env .env
	linkCommonFile env/profile .profile
}

installBash
installZsh
#installVim
#installGdb
installEnv

echo "chsh -s $(which bash) or $(which zsh)"
