# Dotfiles


## Installation /update
 
```
cd ~/projects
git clone git@bitbucket.org:2xyo/dotfiles.git
cd dotfiles

git remote add origin ssh://git@bitbucket.org/2xyo/dotfiles.git
git pull origin master
cd dotfiles
git branch <computer-name>
./install.sh

```


```
## Profiles

### X session startup

```
. ~/.profile
	. ~/.config/dotfiles/env.sh
		~/.config/dotfiles/hosts/<branch>/env.sh

```

### Interactive login shell

or as a non-interactive shell with the --login  == login at the console (Ctrl+Alt+F1..F6), or connecting via ssh.

```
. /etc/profile
.  ~/.bash_profile
	.  $BASH_IT/bash_it.sh
	. ~/.config/dotfiles/env.sh
		~/.config/dotfiles/hosts/<branch>/env.sh
	. ~/.config/dotfiles/alias.sh
		~/.config/dotfiles/hosts/<branch>/alias.sh

# OR
.  ~/zshrc
	. ~/.oh-my-zsh/oh-my-zsh.sh
	. ~/.config/dotfiles/alias.sh
		~/.config/dotfiles/hosts/<branch>/alias.sh

```


### interactive shell that is not a login shell is started

```
.  /etc/bash.bashrc 
.  ~/.bashrc
	.  ~/.bash_profile
		. ~/.bash_it/bash_it.sh
		. ~/.config/dotfiles/env.sh
			~/.config/dotfiles/hosts/<branch>/env.sh
		. ~/.config/dotfiles/alias.sh
			~/.config/dotfiles/hosts/<branch>/alias.sh

# OR

.  ~/zshrc
	. ~/.oh-my-zsh/oh-my-zsh.sh
	. ~/.config/dotfiles/alias.sh
		~/.config/dotfiles/hosts/<branch>/alias.sh

```

## Maintenance 

### On common branch

```
git checkout master
# do your stuff
git add files
git commit -m "comment"
git push origin master

# merge modif on local host
git checkout laptop-asus 
git merge laptop-asus master
git push origin laptop-asus

# merge modif on remote host
git checkout master
git pull origin master
git checkout laptop-taff
git merge laptop-taff master
git push origin laptop-taff 

```

### On local branch

```
git checkout laptop-asus
# do your stuff
git add files
git commit -m "comment"
git push origin laptop-asus
```
