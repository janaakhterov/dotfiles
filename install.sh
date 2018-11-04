#!/bin/sh

dotfiles="$HOME/.dotfiles"
config="$HOME/Config"

# Remove all dotfiles that will be overwritten
rm -rf ~/.config > /dev/null 2>&1

rm -rf ~/.zsh > /dev/null 2>&1
rm -rf ~/.zshrc > /dev/null 2>&1
rm -rf ~/.zshenv > /dev/null 2>&1

rm -rf ~/.vim > /dev/null 2>&1
rm -rf ~/.vimrc > /dev/null 2>&1

rm -rf ~/.Xresources > /dev/null 2>&1
rm -rf ~/.xinit > /dev/null 2>&1

# submodules
echo "Initializing submodules..."
git submodule update --init --recursive

echo "Linking ~/.config -> ~/.dotfiles"
ln -sf $dotfiles $config

# zsh
echo "Setting up zsh..."
ln -sf $config/zsh $HOME/.zsh
ln -sf $config/zsh/zshrc $HOME/.zshrc
ln -sf $config/zsh/zshenv $HOME/.zshenv

# vim
echo "Setting up vim..."
ln -sf $config/vim $HOME/.vim
ln -sf $config/vim/vimrc $HOME/.vimrc

# X
echo "Setting up X..."
ln -sf $config/Xresources $HOME/.Xresources
ln -sf $config/xinit $HOME/.xinit
