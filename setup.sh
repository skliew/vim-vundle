#!/bin/sh
cd $HOME
git clone https://github.com/skliew/vim-vundle.git .vim
git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/Vundle.vim
rm -i $HOME/.vimrc
ln -s $HOME/.vim/.vimrc .vimrc
vim +PluginInstall +q +q

ln -s $HOME/.vim/init.lua $HOME/.config/nvim/init.lua
