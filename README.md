README
======

This is my setup using Vundle:

- cd ~
- git clone https://github.com/skliew/vim-vundle.git .vim
- install Vundle
- rm .vimrc # In case you already have one
- ln -s $HOME/.vim/.vimrc .vimrc
- run BundleInstall in vim

When using Neovim,
- ln -s $HOME/.vim/init.lua $HOME/.config/nvim/init.lua

Or use [setup.sh](setup.sh) to run the above steps.

To install Vundle, see [https://github.com/gmarik/Vundle.vim](https://github.com/gmarik/Vundle.vim).

