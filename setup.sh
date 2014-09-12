#!/bin/sh
cd $HOME
git clone https://github.com/skliew/vim-vundle.git .vim
git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/Vundle.vim
rm -i $HOME/.vimrc
ln -s $HOME/.vim/.vimrc .vimrc
vim +BundleInstall +q +q
