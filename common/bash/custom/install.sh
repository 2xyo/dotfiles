#!/usr/bin/env sh
BASH_IT="$HOME/.bash_it"

test -w $HOME/.bash_profile &&
  cp $HOME/.bash_profile $HOME/.bash_profile.bak &&
  echo "Your original .bash_profile has been backed up to .bash_profile.bak"

cp $HOME/.bash_it/template/bash_profile.template.bash $HOME/.bash_profile

echo "Copied the template .bash_profile into ~/.bash_profile, edit this file to customize bash-it"


cp $HOME/.bash_it/template/jekyllconfig.template.bash $HOME/.jekyllconfig
echo "Copied the template .jekyllconfig into your home directory. Edit this file to customize bash-it for using the Jekyll plugins"





ALIASES=$(cat <<EOF
general
git
hg
vim
EOF
)

PLUGINS=$(cat <<EOF
dirs
git
hg
ssh
tmux
tmuxinator
python
EOF
)

COMPLETION=$(cat <<EOF
bash-it
django
git
git_flow
pip
tmux
EOF
)


load_all() {
  echo $1
  echo $2
  echo "$2"
  # file_type=$1
  # [ ! -d "$BASH_IT/$file_type/enabled" ] && mkdir "$BASH_IT/${file_type}/enabled"
  # for src in $BASH_IT/${file_type}/available/*; do
  #     filename="$(basename ${src})"
  #     [ ${filename:0:1} = "_" ] && continue
  #     dest="${BASH_IT}/${file_type}/enabled/${filename}"
  #     if [ ! -e "${dest}" ]; then
  #         ln -s "${src}" "${dest}"
  #     else
  #         echo "File ${dest} exists, skipping"
  #     fi
  #done
}

for i in "$ALIASES"; do
  echo $i
done