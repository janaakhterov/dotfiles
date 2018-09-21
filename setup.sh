#!/bin/sh
if [ -d "~/.config" ]; then
    echo "~/.config directory already exists"
    exit 
fi

if [ -d "~/Config" ]; then
    echo "~/Config directory already exists"
    exit 
fi

mv -T "$PWD" "~/.config"
ln -s "$PWD" "~/Config"

ln -s "$PWD/vim" "~/.vim"
ln -s "$PWD/qutebrowser" "~/.qutebrowser"
