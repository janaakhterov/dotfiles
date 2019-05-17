#!/bin/sh
cd $HOME

# Set this just in case otherwise nix might not install 
sudo sysctl kernel.unprivileged_userns_clone=1

# Install Nix package manager
curl https://nixos.org/nix/install | sh
. $HOME/.nix-profile/etc/profile.d/nix.sh

nix-env --install exa
nix-env --install yadm
nix-env --install fish
nix-env --install go
nix-env --install fzf
nix-env --install diff-so-fancy
nix-env --install nitrogen

# Diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# Initialize dotfiles
yadm clone --recurse-submodules -j8 https://github.com/danielakhterov/.dotfiles.git

# ZPlugin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

# GHQ
go get github.com/motemen/ghq

# Fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish && fish --command fisher

# Change shell to fish
chsh -s /usr/bin/fish

# i3lock-fancy
git clone https://github.com/meskarune/i3lock-fancy
cd $HOME/i3lock-fancy
sudo make install
cd $HOME
rm -rf i3lock-fancy
