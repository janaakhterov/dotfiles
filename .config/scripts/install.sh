#!/bin/sh

# curl https://raw.githubusercontent.com/danielakhterov/.dotfiles/master/.config/scripts/install.sh | sh

UPDATE_VARIABLES=false

if sysctl kernel.unprivileged_userns_clone 2>&1 | grep "0" > /dev/null 2>&1; then
    echo "Changing kernel.unprivileged_userns_clone to 1 requires sudo permissions"
    echo "command: sudo sysctl kernel.unprivileged_userns_clone=1"
    sudo sysctl kernel.unprivileged_userns_clone=1
fi

if ! command -v nix-env > /dev/null 2>&1; then
    echo "Installing nix package manager..."
    curl https://nixos.org/nix/install > /dev/null 2>&1 | sh
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

if ! nix-channel --list | awk '{print $1;}' | grep "nixos" > /dev/null; then
    echo "Adding nixos channel..."
    nix-channel --add https://releases.nixos.org/nixos/19.03/nixos-19.03.172764.50d5d73e22b > /dev/null 2>&1
    UPDATE_VARIABLES=true
fi

if ! nix-channel --list | awk '{print $1;}' | grep "nixpkgs" > /dev/null; then
    echo "Adding nixpkgs-unstable channel..."
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable > /dev/null 2>&1
    UPDATE_VARIABLES=true
fi

if ! nix-channel --list | awk '{print $1;}' | grep "home-manager" > /dev/null; then
    echo "Adding home-manager channel..."
    nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager > /dev/null 2>&1
    UPDATE_VARIABLES=true
fi

if [ "$UPDATE_VARIABLES" = true ]; then
    echo "Updating channels..."
    nix-channel --update > /dev/null 2>&1
fi

# Sometimes required by home-manager especially on non NixOS machines
echo "Setting NIX_PATH env to " $HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

if ! command -v home-manager > /dev/null 2>&1; then
    echo "Installing home-manager..."
    nix-shell '<home-manager>' -A install > /dev/null 2>&1
fi

if command -v home-manager > /dev/null 2>&1; then
    echo "Insatlling packages using home-manager..."
    echo "Uninstalling packages that home-manager installs. This is required otherwise home-manager will fail to install..."
    nix-env --uninstall alacritty > /dev/null 2>&1
    nix-env --uninstall diff-so-fancy > /dev/null 2>&1
    nix-env --uninstall exa > /dev/null 2>&1
    nix-env --uninstall firefox > /dev/null 2>&1
    nix-env --uninstall fish > /dev/null 2>&1
    nix-env --uninstall fzf
    nix-env --uninstall ghq > /dev/null 2>&1
    nix-env --uninstall go > /dev/null 2>&1
    nix-env --uninstall hack-font > /dev/null 2>&1
    nix-env --uninstall i3lock-fancy-unstable > /dev/null 2>&1
    nix-env --uninstall nitrogen > /dev/null 2>&1
    nix-env --uninstall polybar > /dev/null 2>&1
    nix-env --uninstall rustup > /dev/null 2>&1
    nix-env --uninstall yadm > /dev/null 2>&1

    echo "Creating $HOME/.config/nixpkgs..."
    mkdir -p $HOME/.config/nixpkgs
    echo "Downloading home.nix from github..."
    curl -o $HOME/.config/nixpkgs/home.nix https://raw.githubusercontent.com/danielakhterov/.dotfiles/master/.config/nixpkgs/home.nix > /dev/null 2>&1

    echo "Running home-manager..."
    home-manager switch > /dev/null 2>&1
elif command -v nix-env > /dev/null 2>&1; then
    echo "Installing packages using nix-env..."
    nix-env --install alacritty > /dev/null 2>&1
    nix-env --install diff-so-fancy > /dev/null 2>&1
    nix-env --install exa > /dev/null 2>&1
    nix-env --install firefox > /dev/null 2>&1
    nix-env --install fish > /dev/null 2>&1
    nix-env --install fzf > /dev/null 2>&1
    nix-env --install ghq > /dev/null 2>&1
    nix-env --install go > /dev/null 2>&1
    nix-env --install hack-font > /dev/null 2>&1
    nix-env --install i3lock-fancy-unstable > /dev/null 2>&1
    nix-env --install nitrogen > /dev/null 2>&1
    nix-env --install polybar --arg i3Support true --arg pulseSupport true --arg mpdSupport true > /dev/null 2>&1
    nix-env --install rustup > /dev/null 2>&1
    nix-env --install vim > /dev/null 2>&1
    nix-env --install yadm > /dev/null 2>&1
else
    echo "Failed to install packages because nix-env and home-manager failed to install"
    exit 1
fi

if command -v rustup > /dev/null 2>&1; then
    echo "Setting default toolchain for rustup to nightly..."
    rustup default nightly > /dev/null 2>&1
fi

# Runs the home-manager which installs all packages/programs from ~/.config/nixpkgs/home.nix

# Diff-so-fancy
# Updates git to use diff-so-fancy for it's pager
if command -v diff-so-fancy > /dev/null 2>&1 && ! git config --list | grep "core.pager" > /dev/null 2>&1; then
    echo "Updating git pager to use diff-so-fancy..."
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi

if command -v yadm > /dev/null 2>&1 && ! yadm remote show origin | grep "Fetch URL:" > /dev/null 2>&1; then
    echo "Initializing dotfiles using yadm..."
    yadm clone https://github.com/danielakhterov/.dotfiles.git > /dev/null 2>&1
fi

# ZPlugin | Zsh package manager
if command -v zsh > /dev/null 2>&1 && ! zsh -c "command -v zsh > /dev/null 2>&1 || exit 1;" > /dev/null 2>&1; then
    echo "Installing zplugin..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh > /dev/null 2>&1)" > /dev/null 2>&1
fi

# Fisher | Fish package manager
if command -v fish > /dev/null 2>&1 && ! fish -c "fisher --help > /dev/null 2>&1; or exit 1" > /dev/null 2>&1; then
    echo "Installing fisher..."
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish > /dev/null 2>&1
    echo "Running fisher..."
    fish -c fisher > /dev/null 2>&1
fi

if command -v vim > /dev/null 2>&1; then
    echo "Installing vim plugins..."
    vim +PlugInstall +qal\! > /dev/null 2>&1
fi

echo "Restart your display manager or restart your computer to apply changes"
echo "Done!"
