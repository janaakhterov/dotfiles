#!/bin/sh

# grub
sudo apt-get -y install grub2

# compton
sudo apt-get -y install compton

# i3
sudo apt-get -y install i3

# zsh
sudo apt-get -y install zsh
chsh -s /usr/bin/zsh

# feh
sudo apt-get -y install feh

# URXVT
sudo apt-get -y install rxvt-unicode-256color

# hack.ttf
sudo apt-get -y install hack.ttf

# git
sudo apt-get -y install git

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# CMake
sudo apt-get -y install cmake

# Curl
sudo apt-get -y install curl

# nCurses
sudo apt-get -y install libncurses5-dev libncursesw5-dev

# OpenSSL
sudo apt-get -y install libssl-dev

# Xorg
# Installed to make sure vim compiles with +clipboard
sudo apt-get install xorg-dev

# Rust
sudo -H -u daniel bash -c "curl https://sh.rustup.rs -sSf | sh"

export PATH=$PATH:$HOME/.cargo/bin

# Exa
cargo install exa

# Cargo Edit
cargo install cargo-edit

# Vim
git clone https://github.com/vim/vim.git
cd vim
./configure --enable-rubyinterp=dynamic --enable-cscope --enable-gui=auto --enable-gtk2-check --enable-gnome-check --with-features=huge --with-x
sudo make install
cd ..
rm -rf vim
