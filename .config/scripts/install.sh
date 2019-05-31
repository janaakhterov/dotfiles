#!/bin/sh

# curl https://raw.githubusercontent.com/danielakhterov/.dotfiles/master/.config/scripts/install.sh | sh

UPDATE_VARIABLES=false

if sysctl kernel.unprivileged_userns_clone | grep "0" > /dev/null 2>&1; then
    echo "Changing kernel.unprivileged_userns_clone to 1 requires sudo permissions"
    echo "command: sudo sysctl kernel.unprivileged_userns_clone=1"
    sudo sysctl kernel.unprivileged_userns_clone=1
fi

if ! command -v nix-env > /dev/null 2>&1; then
    echo "Installing nix package manager..."
    curl https://nixos.org/nix/install | sh
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

if ! nix-channel --list | awk '{print $1;}' | grep "nixos" > /dev/null; then
    echo "Adding nixos channel..."
    nix-channel --add https://releases.nixos.org/nixos/19.03/nixos-19.03.172764.50d5d73e22b
    UPDATE_VARIABLES = true
fi

if ! nix-channel --list | awk '{print $1;}' | grep "nixpkgs" > /dev/null; then
    echo "Adding nixpkgs-unstable channel..."
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable
    UPDATE_VARIABLES = true
fi

if ! nix-channel --list | awk '{print $1;}' | grep "home-manager" > /dev/null; then
    echo "Adding home-manager channel..."
    nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
    UPDATE_VARIABLES = true
fi

if [ "$UPDATE_VARIABLES" = true ]; then
    echo "Updating channels..."
    nix-channel --update
fi

# Sometimes required by home-manager especially on non NixOS machines
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

# Install home-manager
if ! command -v home-manager > /dev/null 2>&1; then
    echo "Installing home-manager..."
    nix-shell '<home-manager>' -A install
fi

if command -v home-manager > /dev/null 2>&1; then
    # Uninstall all packages
    echo "Insatlling packages using home-manager..."
    echo "Uninstalling packages that home-manager installs..."
    nix-env --uninstall alacritty
    nix-env --uninstall diff-so-fancy
    nix-env --uninstall exa
    nix-env --uninstall firefox
    nix-env --uninstall fish
    nix-env --uninstall fzf
    nix-env --uninstall ghq
    nix-env --uninstall go
    nix-env --uninstall hack-font
    nix-env --uninstall i3lock-fancy-unstable
    nix-env --uninstall nitrogen
    nix-env --uninstall polybar
    nix-env --uninstall rustup
    nix-env --uninstall yadm

    echo "Running home-manager..."
    home-manager switch > /dev/null 2>&1
elif command -v nix-env > /dev/null 2>&1; then
    echo "Installing packages using nix-env..."
    nix-env --install alacritty
    nix-env --install diff-so-fancy
    nix-env --install exa
    nix-env --install firefox
    nix-env --install fish
    nix-env --install fzf
    nix-env --install ghq
    nix-env --install go
    nix-env --install hack-font
    nix-env --install i3lock-fancy-unstable
    nix-env --install nitrogen
    nix-env --install polybar
    nix-env --install rustup
    nix-env --install yadm
else
    echo "Failed to install packages because nix-env and home-manager failed to install"
    exit 1
fi

# Runs the home-manager which installs all packages/programs from ~/.config/nixpkgs/home.nix

# Diff-so-fancy
# Updates git to use diff-so-fancy for it's pager
if command -v diff-so-fancy > /dev/null 2>&1 && ! git config --list | grep "core.pager" > /dev/null 2>&1; then
    echo "Updating git pager to use diff-so-fancy..."
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi

if ! yadm remote show origin | grep "Fetch URL:" > /dev/null 2>&1; then
    echo "Initializing dotfiles using yadm..."
    yadm clone --recurse-submodules -j8 https://github.com/danielakhterov/.dotfiles.git
fi

# ZPlugin | Zsh package manager
if ! zsh -c "command -v zsh > /dev/null 2>&1 || exit 1;"; then
    echo "Installing zplugin..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

# Fisher | Fish package manager
if ! fish -c "fisher --help > /dev/null 2>&1; or exit 1"; then
    echo "Installing fisher..."
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
    echo "Running fisher..."
    fish -c fisher
fi
