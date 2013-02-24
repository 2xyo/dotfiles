Processus de gestion des dotfiles


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
