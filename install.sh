#!/bin/sh

dotfiles="$HOME/.dotfiles"
config="$HOME/Config"

lnif() {
  if [ ! -e $2 ] ; then
    ln -s $1 $2
  fi
}

# submodules
echo "Initializing submodules..."
git submodule update --init --recursive

if [ ! "$PWD" = "$dotfiles" ]; then
    echo "Moving dotfiles into ~/.config"
    if [ -e $HOME/.config ]; then
        mv $HOME/.config/* $dotfiles
        rm -r $HOME/.config
    fi
    mv $dotfiles $config
    lnif $config $HOME/.config
fi

# zsh
echo "Setting up zsh..."
lnif $config/zsh $HOME/.zsh
lnif $config/zsh/zshrc $HOME/.zshrc
lnif $config/zsh/zshenv $HOME/.zshenv

# vim
echo "Setting up vim..."
lnif $config/vim $HOME/.vim
lnif $config/vim/vimrc $HOME/.vimrc

# X
echo "Setting up X..."
lnif $config/Xresources $HOME/.Xresources
lnif $config/xinit $HOME/.xinit
