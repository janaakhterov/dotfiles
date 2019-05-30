#!/bin/sh
# Set this just in case otherwise nix might not install 
# sudo sysctl kernel.unprivileged_userns_clone=1

# Install Nix package manager
# curl https://nixos.org/nix/install | sh
# . $HOME/.nix-profile/etc/profile.d/nix.sh

# Uninstall all packages
nix-env -e ".*"

nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update

# Install home-manager
nix-shell '<home-manager>' -A install

home-manager switch
# nix-env --install exa
# nix-env --install yadm
# nix-env --install fish
# nix-env --install go
# nix-env --install fzf
# nix-env --install diff-so-fancy
# nix-env --install nitrogen
# nix-env --install polybar
# nix-env --install firefox
# nix-env --install i3lock-fancy-unstable
# nix-env --install ghq
# nix-env --install hack-font

# Diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# Initialize dotfiles
yadm clone --recurse-submodules -j8 https://github.com/danielakhterov/.dotfiles.git

# ZPlugin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

# Fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish && fish --command fisher
