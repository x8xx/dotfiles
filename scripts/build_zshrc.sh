#!/bin/bash
set -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

echo "#Load Configure" > ../files/.zshrc
for CONF in `ls ../files/zsh/ | sed 's/ //g'`
do
    echo $CONF
    echo "source ~/dotfiles/files/zsh/${CONF}" >> ../files/.zshrc
done
