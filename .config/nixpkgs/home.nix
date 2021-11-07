{ config, pkgs, ... }:
let 
  name = "Daniel Akhterov";
  email = "akhterovd@gmail.com";
in
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  fonts.fontconfig.enable = true;

  home.packages = [
    (pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
      pulseSupport = true;
      nlSupport = true;
      githubSupport = true;
    })
    pkgs._1password
    pkgs.alacritty
    pkgs.alsaUtils
    pkgs.bat
    pkgs.binutils
    pkgs.cargo-edit
    pkgs.comfortaa
    pkgs.ctags
    pkgs.direnv
    pkgs.discord
    pkgs.dunst
    pkgs.emacs
    pkgs.exa
    pkgs.fantasque-sans-mono
    pkgs.feh
    pkgs.firefox
    pkgs.fish
    pkgs.font-awesome
    pkgs.fuse
    pkgs.fzf
    pkgs.gcc
    pkgs.ghq
    pkgs.gitAndTools.diff-so-fancy
    pkgs.gnumake
    pkgs.go
    pkgs.nerdfonts
    pkgs.i3
    pkgs.i3lock-fancy
    pkgs.iosevka
    pkgs.jq
    pkgs.keychain
    pkgs.libnotify
    pkgs.lxappearance
    pkgs.maim
    pkgs.maven
    pkgs.pulseaudio
    # pkgs.python3
    pkgs.rofi-unwrapped
    pkgs.rustup
    pkgs.slack
    # pkgs.spotify
    pkgs.starship
    pkgs.steam
    pkgs.xautolock
    pkgs.xclip
    pkgs.yadm
    pkgs.youtube-dl
    pkgs.vivid
    pkgs.starship
    pkgs.tmux
  ];

  services.lorri.enable = true;

  programs.gpg.enable = true;

  programs = {
    git = {
      enable = true;
      userName = "${name}";
      userEmail = "${email}";
      ignores = [
	".idea/"
	".cache"
	"*.log"
	".settings"
	".classpath"
	".project"
	"!.github/"
	".envrc"
      ];
    };
  };

  programs.home-manager = {
    enable = true;
    path = "https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz";
  };

  xdg.configFile."nvim" = {
    source = /home/danielakhterov/.config/nvim;
    recursive = true;
  };
  
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
  };
}
