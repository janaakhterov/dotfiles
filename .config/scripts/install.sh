#!/bin/sh

dotfiles="$HOME/.dotfiles"
Config="$HOME/Config"
config="$HOME/.config"

# Remove all dotfiles that will be overwritten
rm -rf $Config > /dev/null 2>&1
rm -rf $config > /dev/null 2>&1

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

# Scripts
echo "Adding scripts to path"
export PATH=$PATH:$config/scripts

echo "Linking ~/Config -> ~/.dotfiles"
ln -sf $dotfiles $Config

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
xrdb $HOME/.Xresources
ln -sf $config/xinit $HOME/.xinit

# Profile
echo "Setting up profile..."
ln -sf $config/profile $HOME/.profile
