#/usr/bin/env check
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

checkSubtree ()
{
	GIT=$(which git)
	$GIT subtree > /dev/null 2>&1 

	if [  $? -eq 1  ]; then
		cat <<'EOF'
Install or activate git subtree
sudo chmod +x /usr/share/doc/git/contrib/subtree/git-subtree.sh
sudo ln -s /usr/share/doc/git/contrib/subtree/git-subtree.sh /usr/lib/git-core/git-subtree

Or:

git clone https://github.com/git/git.git
cd git/contrib/subtree
make
sudo install -m 755 git-subtree /usr/lib/git-core

EOF

		exit 1
	fi
}

installOrUpdateSubtree()
{
	# 1 name 
	# 2 path
	# 3 url
	if ! contains "$(git branch -a)" "$1"
	then
		echo ">> Add branch $1 "
		git remote add -f $1 $3
	else
		echo ">> Fetch branch $1"
		git fetch $1 master
	fi
	
	if [ ! -d "$2" ]
	then
		echo ">> subtree add $1"
		git subtree add --prefix $2 $1 master --squash
	else
		echo ">> subtree pull $1"
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
	echo "> Install BASH"
	installOrUpdateSubtree bash-it common/bash/bash-it  https://github.com/revans/bash-it.git 
	linkCommonFile bash/bash-it .bash_it
	cp --remove-destination `readlink ~/.bash_profile` ~/.bash_profile
	$HOME/.bash_it/install.sh
	linkCommonFile bash/custom/bash_profile .bash_profile
	linkCommonFile bash/custom/bashrc .bashrc
	linkCommonFile bash/custom/inputrc .inputrc
}

installZsh()
{
	echo "> Install ZSH"
	installOrUpdateSubtree oh-my-zsh common/zsh/oh-my-zsh https://github.com/robbyrussell/oh-my-zsh.git
	linkCommonFile zsh/oh-my-zsh .oh-my-zsh
	linkCommonFile zsh/custom/zshrc .zshrc
}

installVim()
{	
	echo "> Install VIM"
	installOrUpdateSubtree vim-pathogen common/vim/plugins/vim-pathogen https://github.com/tpope/vim-pathogen.git
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	linkCommonFile vim/plugins/vim-pathogen/autoload/pathogen.vim .vim/autoload/pathogen.vim
	linkCommonFile vim/vimrc .vimrc
}

installPython()
{
	echo "> Install Python"
	linkCommonFile python/pythonrc .pythonrc
}

installGit()
{
	echo "> Install GIT"
	linkCommonFile git/gitconfig .gitconfig
}

installHg()
{
	echo "> Install HG"
	linkCommonFile hg/hgrc .hgrc
}

installGdb()
{
	echo "> Install GDB"
	installOrUpdateSubtree Gdbinit common/gdb/Gdbinit https://github.com/gdbinit/Gdbinit.git
	linkCommonFile gdb/Gdbinit/gdbinit .gdbinit
}

installEnv()
{
	echo "> Install ENV"
	mkdir -p ~/.config/dotfiles
	linkCommonFile env/env.sh .config/dotfiles/env.sh
	linkCommonFile env/alias.sh .config/dotfiles/alias.sh
	ln -fs ${PWD}/hosts ~/.config/dotfiles/hosts
	linkCommonFile env/profile .profile
}

checkSubtree
installEnv

installBash
installZsh

installVim
installGdb
installHg
installGit
installPython

echo "chsh -s $(which zsh)"
