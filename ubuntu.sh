#!/bin/sh

# grub
sudo apt-get install grub2

# i3
sudo apt-get install i3

# feh
sudo apt-get install feh

# URXVT
sudo apt-get install rxvt-unicode-256color

# git
sudo apt-get install git

# CMake
sudo apt-get install cmake

# Curl
sudo apt-get install curl

# nCurses
sudo apt-get install libncurses5-dev libncursesw5-dev

# OpenSSL
sudo apt-get install libssl-dev

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
