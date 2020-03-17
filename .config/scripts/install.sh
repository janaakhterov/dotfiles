#!/bin/bash

# curl https://raw.githubusercontent.com/danielakhterov/.dotfiles/master/.config/scripts/install.sh | sh

UPDATE_VARIABLES=false
PKGS=(
    "alacritty"
    "alsamixer"
    "android-studio-canary"
    "bat"
    "diff-so-fancy"
    "discord"
    "exa"
    "feh"
    "firefox"
    "fzf"
    "gcc"
    "ghq"
    "go"
    "htop"
    "i3"
    "idea-community"
    "pulseaudio"
    "polybar --arg i3Support true --arg pulseSupport true --arg mpdSupport true"
    "rustup"
    "shutter"
    "steam"
    "vim"
    "xautolock"
    "yadm"
    "youtube-dl"
    "maim"
)
SPECIAL_PKGS=(
    "binutils"
    "cargo-edit"
    "i3lock-fancy-unstable"
    "neovim"
    "openjdk8"
    "rofi-unwrapped"
)
FONT_PKGS=(
    "hack-font"
)

function nix_install() {
    for pkg in "${PKGS[@]}"; do
        if ! command -v $(echo "$pkg" | awk '{print $1;}') > /dev/null 2>&1; then
            echo "installing $pkg..."
            nix-env -i $pkg > /dev/null 2>&1
        fi
    done
}

function nix_uninstall() {
    for pkg in "${PKGS[@]}"; do
        echo "uninstalling $pkg..."
        nix-env -e $pkg > /dev/null 2>&1
    done
}

function nix_install_special() {
    for pkg in "${PKGS[@]}"; do
        case $pkg in
            "binutils")
            ;;
            "cargo-edit")
                if ! cargo add 2>&1 | grep "Invalid arguments." > /dev/null 2>&1; then
                    nix-env -i $pkg > /dev/null 2>&1
                fi
            ;;
            "i3lock-fancy-unstable")
                if ! command -v i3lock-fancy > /dev/null 2>&1; then
                    nix-env -i $pkg > /dev/null 2>&1
                fi
            ;;
            "neovim")
                if ! command -v nvim > /dev/null 2>&1; then
                    nix-env -i $pkg > /dev/null 2>&1
                fi
            ;;
            "openjdk8")
                if ! command -v java > /dev/null 2>&1; then
                    nix-env -i $pkg > /dev/null 2>&1
                fi
            ;;
            "rofi-unwrapped")
                if ! command -v rofi > /dev/null 2>&1; then
                    nix-env -i $pkg > /dev/null 2>&1
                fi
            ;;
        esac
    done
}

if sysctl kernel.unprivileged_userns_clone 2>&1 | grep "0" > /dev/null 2>&1; then
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

if command -v home-manager > /dev/null 2>&1 && cat /etc/os-release | grep "^ID=" | cut -d '=' -f 2 | grep "nixos" > /dev/null 2>&1; then
    echo "Installing home-manager..."
    nix-shell '<home-manager>' -A install > /dev/null 2>&1

    echo "Insatlling packages using home-manager..."
    echo "Uninstalling packages that home-manager installs. This is required otherwise home-manager will fail to install..."
    nix_uninstall pkgs

    echo "Creating $HOME/.config/nixpkgs..."
    mkdir -p $HOME/.config/nixpkgs
    echo "Downloading home.nix from github..."
    curl -o $HOME/.config/nixpkgs/home.nix https://raw.githubusercontent.com/danielakhterov/.dotfiles/master/.config/nixpkgs/home.nix > /dev/null 2>&1

    echo "Running home-manager..."
    home-manager switch > /dev/null 2>&1
elif command -v nix-env > /dev/null 2>&1; then
    echo "Installing packages using nix-env..."
    nix_install
else
    echo "Failed to install packages because nix-env and home-manager failed to install"
    exit 1
fi

if command -v rustup > /dev/null 2>&1; then
    if ! rustup default | awk '{print $1;}' | grep "nightly-x86_64-unknown-linux-gnu" > /dev/null 2>&1; then
        echo "Setting default toolchain for rustup to nightly..."
        rustup default nightly > /dev/null 2>&1
    fi

    if ! rustup component list | grep "rust-src (installed)" > /dev/null 2>&1; then
        echo "Downloading rust-src using rustup..."
        rustup component add rust-src > /dev/null 2>&1
    fi
fi

if command -v cargo > /dev/null 2>&1; then
    if ! command -v rusty-tags > /dev/null 2>&1; then
        echo "Insatlling rusty-tags using cargo..."
        cargo install rusty-tags > /dev/null 2>&1
    fi
fi

if command -v diff-so-fancy > /dev/null 2>&1 && ! git config --list | grep "core.pager" > /dev/null 2>&1; then
    echo "Updating git pager to use diff-so-fancy..."
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX" > /dev/null 2>&1
fi

if command -v yadm > /dev/null 2>&1 && ! yadm remote show origin | grep "Fetch URL:" > /dev/null 2>&1; then
    echo "Initializing dotfiles using yadm..."
    yadm clone https://github.com/danielakhterov/.dotfiles.git > /dev/null 2>&1
fi

if command -v zsh > /dev/null 2>&1 && ! zsh -c "command -v zsh > /dev/null 2>&1 || exit 1;" > /dev/null 2>&1; then
    echo "Installing zplugin..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh > /dev/null 2>&1)" > /dev/null 2>&1
fi

if command -v fish > /dev/null 2>&1 && ! fish -c "fisher --help > /dev/null 2>&1; or exit 1" > /dev/null 2>&1; then
    echo "Installing fisher..."
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish > /dev/null 2>&1
    echo "Running fisher..."
    fish -c fisher > /dev/null 2>&1
fi

if command -v vim > /dev/null 2>&1; then
    echo "Installing and Updating vim plugins..."
    vim +PlugInstall +PlugUpgrade +PlugUpdate +qal\! > /dev/null 2>&1
fi

echo "Restart your display manager or restart your computer to apply changes"
echo "Done!"
