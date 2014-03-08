#!/bin/sh
cd $HOME
git clone https://github.com/darkgrin/vim-vundle.git .vim
git clone https://github.com/gmarik/vundle .vim/bundle/vundle
rm -i $HOME/.vimrc
ln -s $HOME/.vim/.vimrc .vimrc
vim +BundleInstall +q +q
