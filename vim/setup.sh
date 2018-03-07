#!/bin/bash

URL_VUNDLE="https://github.com/VundleVim/Vundle.vim.git"
SRC_VIMRC="https://raw.githubusercontent.com/redfish-lee/.dotfiles/master/vim/vimrc"
SRC_DOTFILES="git@github.com:redfish-lee/.dotfiles.git"

if [ ! -f ~/.vim/bundle/Vundle.vim ]; then
    git clone $URL_VUNDLE ~/.vim/bundle/Vundle.vim
    echo "Install Vundle"
fi

if [ -f ~/.vimrc ]; then
    echo "Backup .vimrc"
    mv ~/.vimrc ~/.vimrc.old
fi

# supposed ` ~/.dotfiles` is already exist
echo "Update .vimrc"
mv ~/.dotfiles/vim/vimrc ~/.vimrc
vim +PluginInstall +qall
