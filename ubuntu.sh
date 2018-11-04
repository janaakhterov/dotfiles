#!/bin/sh

# grub
sudo apt-get -y install grub2

# compton
sudo apt-get -y install compton

# i3
sudo apt-get -y install i3

# zsh
sudo apt-get -y install zsh
sudo chsh -s /usr/bin/zsh

# feh
sudo apt-get -y install feh

# URXVT
sudo apt-get -y install rxvt-unicode-256color

# git
sudo apt-get -y install git

# CMake
sudo apt-get -y install cmake

# Curl
sudo apt-get -y install curl

# nCurses
sudo apt-get -y install libncurses5-dev libncursesw5-dev

# OpenSSL
sudo apt-get -y install libssl-dev

# Rust
curl https://sh.rustup.rs -sSf | sh

# Exa
cargo isntall exa

# Cargo Edit
cargo isntall cargo-edit

# Vim
git clone https://github.com/vim/vim.git
cd vim
make
cd src
sudo make install
sudo mv ./vim /usr/bin/
cd ../..
rm -rf vim
