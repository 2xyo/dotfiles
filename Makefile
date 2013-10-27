DOTFILES := $(shell pwd)
# Source:https://github.com/lanej/dotfiles/blob/master/Makefile
# TODO: https://github.com/scrooloose/syntastic.git



install: install-zsh

config-git:
	sudo chmod +x /usr/share/doc/git/contrib/subtree/git-subtree.sh
	sudo ln -fs /usr/share/doc/git/contrib/subtree/git-subtree.sh /usr/lib/git-core/git-subtree

update: update-subtree

update-subtree: update-bash update-zsh update-vim


install-bash:
	git remote add -f bash-it https://github.com/revans/bash-it.git
	git subtree add --prefix common/bash/bash-it bash-it master --squash


install-zsh:
	git remote add -f oh-my-zsh https://github.com/robbyrussell/oh-my-zsh.git
	git subtree add --prefix common/zsh/oh-my-zsh oh-my-zsh master --squash


install-vim:
	git remote add -f bash-it https://github.com/revans/bash-it.git
	git subtree add --prefix common/bash/bash-it bash-it master --squash

install-git:
	ln -fs $(DOTFILES)/common/git/gitconfig ${HOME}/.gitconfig
	ln -fs $(DOTFILES)/common/git/gitignore ${HOME}/.gitignore

common-hg:
	ln -fs $(DOTFILES)/common/hg/hgrc ${HOME}/.hgrc
	ln -fs $(DOTFILES)/common/hg/hgignore ${HOME}/.hgignore

common-bash:
	echo "Install bash"

commond-zsh:
	echo "Install zsh"

common-vim:
	ln -fns $(DOTFILES)/vim ${HOME}/.vim
	ln -fs $(DOTFILES)/vim/vimrc ${HOME}/.vimrc
	ln -fs $(DOTFILES)/vim/gvimrc ${HOME}/.gvimrc


commond-shell:
	ln -fs $(DOTFILES)/bash/bashrc ${HOME}/.bashrc
	ln -fs $(DOTFILES)/bash/bashenv ${HOME}/.bashenv
	ln -fs $(DOTFILES)/bash/bashrc ${HOME}/.bashrc
	ln -fs $(DOTFILES)/profile ${HOME}/.bash_profile
	ln -fs $(DOTFILES)/profile ${HOME}/.zprofile
	ln -fs $(DOTFILES)/bash/homebrew_profile ${HOME}/.homebrew.profile
	ln -fns $(DOTFILES)/bin/ ${HOME}/bin
	sh ${DOTFILES}/zsh/oh_my_zsh ${DOTFILES}
	ln -fs $(DOTFILES)/zsh/zshrc ${HOME}/.zshrc
	ln -fs $(DOTFILES)/zsh/zlogout ${HOME}/.zlogout
	ln -fs $(DOTFILES)/zsh/zshenv ${HOME}/.zshenv
	ln -fs $(DOTFILES)/friends ${HOME}/.friends
	ln -fs $(DOTFILES)/ack/ackrc ${HOME}/.ackrc
	ln -fns $(DOTFILES)/etc/ ${HOME}/etc
	ln -fs ${DOTFILES}/bash/alias ${HOME}/.alias
	sh ${DOTFILES}/bash/ssh-config ${DOTFILES}
common-screen:
	ln -fs $(DOTFILES)/rc/screenrc ${HOME}/.screenrc

common-tmux:
	ln -fs $(DOTFILES)/rc/tmux.conf ${HOME}/.tmux.conf


