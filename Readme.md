# Dotfiles


## Installation
 
```
cd projects
git clone git@bitbucket.org:2xyo/dotfiles.git
cd dotfiles
make install common
make install computer-name
```

## Update 
```
cd projects/dotfiles
make update
make install common
make install computer-name
```
## Commonn

```

```

## Bash

## Zsh

## Vim

## Python

## gdb


## Add subtree

Example:
```
# Add
git remote add -f bash-it https://github.com/revans/bash-it.git
git subtree add --prefix common/bash/bash-it bash-it master --squash

# update

git fetch bash-it master
git subtree pull --prefix common/bash/bash-it bash-it master --squash
```


# Modif dans branche commune
git checkout master
# modifications des fichiers..
git add lesfichiers
git commit -m "commentaire"
git push origin master

# Merge dans les autres branches 
# sur les autres postes :
# git checkout  master
# git pull origin master

git checkout laptop-taff 
git merge laptop-taff master
git push origin laptop-taff 

####################################
# Ajout dans une branche
# aller dans la branche laptop taff
git checkout laptop-taff 

# modifications des fichiers..
git add lesfichiers
git commit -m "commentaire"
git push origin laptop-taff



####################################
#ajout d'un nouveau poste
cd
git init
git add .bashrc
git commit -m "base"
git remote add origin ssh://git@bitbucket.org/2xyo/dotfiles.git
# attention, ecrase la conf existante
git pull origin master

git branch laptop-example
git checkout laptop-perso
# modifications des fichiers..
git add lesfichiers
git commit -m "commentaire"
git push origin laptop-perso

####################################
# astuces 

# récupérer un fichier supprimé :
git checkout HEAD^ lefichier
