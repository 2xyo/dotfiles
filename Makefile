DOTFILES := $(shell pwd)
# Source:https://github.com/lanej/dotfiles/blob/master/Makefile
# TODO: https://github.com/scrooloose/syntastic.git

common: shell tmux screen vimfiles _git


common-bash:
		echo "Install bash"

commond-zsh:

common-vim:
        ln -fns $(DOTFILES)/vim ${HOME}/.vim
        ln -fs $(DOTFILES)/vim/vimrc ${HOME}/.vimrc
        ln -fs $(DOTFILES)/vim/gvimrc ${HOME}/.gvimrc

common-git:
        ln -fs $(DOTFILES)/git/gitconfig ${HOME}/.gitconfig
        ln -fs $(DOTFILES)/git/gitignore ${HOME}/.gitignore

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


