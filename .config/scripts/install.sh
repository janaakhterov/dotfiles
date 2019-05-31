#!/bin/sh
# Set this just in case otherwise nix might not install 
# sudo sysctl kernel.unprivileged_userns_clone=1

# Install Nix package manager
if ! command -v nix-env >/dev/null 2>&1; then
    echo "Installing nix..."
    curl https://nixos.org/nix/install | sh
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi


# Add nixos 19.03 channel
if ! nix-channel --list | awk '{print $1;}' | grep "nixos" > /dev/null; then
    echo "Adding nixos channel..."
    nix-channel --add https://releases.nixos.org/nixos/19.03/nixos-19.03.172764.50d5d73e22b
fi

# Add nixpkgs unstable channel
if ! nix-channel --list | awk '{print $1;}' | grep "nixpkgs" > /dev/null; then
    echo "Adding nixpkgs-unstable channel..."
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable
fi

# Add home-manager channel
if ! nix-channel --list | awk '{print $1;}' | grep "home-manager" > /dev/null; then
    echo "Adding home-manager channel..."
    nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
fi

# Update channels
echo "Updating channels..."
nix-channel --update

# Sometimes required by home-manager especially on non NixOS machines
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

# Install home-manager
if ! command -v home-manager >/dev/null 2>&1; then
    echo "Installing home-manager..."
    nix-shell '<home-manager>' -A install

    # Uninstall all packages
    echo "Uninstalling packages that home-manager installs..."
    nix-env --uninstall alacritty
    nix-env --uninstall exa
    nix-env --uninstall yadm
    nix-env --uninstall fish
    nix-env --uninstall go
    nix-env --uninstall fzf
    nix-env --uninstall diff-so-fancy
    nix-env --uninstall nitrogen
    nix-env --uninstall polybar
    nix-env --uninstall firefox
    nix-env --uninstall i3lock-fancy-unstable
    nix-env --uninstall ghq
    nix-env --uninstall hack-font
    nix-env --uninstall rustup

    echo "Running home-manager..."
    home-manager switch
elif ! command -v nix-env >/dev/null 2>&1; then
    echo "Installing packages using nix-env..."
    nix-env --install alacritty
    nix-env --install exa
    nix-env --install yadm
    nix-env --install fish
    nix-env --install go
    nix-env --install fzf
    nix-env --install diff-so-fancy
    nix-env --install nitrogen
    nix-env --install polybar
    nix-env --install firefox
    nix-env --install i3lock-fancy-unstable
    nix-env --install ghq
    nix-env --install hack-font
    nix-env --install rustup
else
    echo "Failed to install packages because nix-env and home-manager failed to install"
    exit 1
fi

# Runs the home-manager which installs all packages/programs from ~/.config/nixpkgs/home.nix

# Diff-so-fancy
# Updates git to use diff-so-fancy for it's pager
if ! command -v diff-so-fancy >/dev/null 2>&1; then
    echo "Updating git pager to use diff-so-fancy..."
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi

# Initialize dotfiles
# yadm clone --recurse-submodules -j8 https://github.com/danielakhterov/.dotfiles.git

# ZPlugin | Zsh package manager
if ! zsh -c "command -v zsh >/dev/null 2>&1 || exit 1;"; then
    echo "Installing zplugin..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

# Fisher | Fish package manager
if ! command -v fisher >/dev/null 2>&1; then
    echo "Installing fisher..."
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish && fish --command fisher
fi
