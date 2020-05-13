{ config, pkgs, ... }:

let 
  name = "Daniel Akhterov";
  email = "akhterovd@gmail.com";
in
{
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
    pkgs.hack-font
    pkgs.ytop
    pkgs.i3
    pkgs.i3lock-fancy
    pkgs.iosevka
    pkgs.jq
    pkgs.keychain
    pkgs.libnotify
    pkgs.lxappearance
    pkgs.maim
    pkgs.maven
    pkgs.neovim
    pkgs.pulseaudio
    pkgs.python
    pkgs.python3
    pkgs.rofi-unwrapped
    pkgs.rustup
    pkgs.slack
    pkgs.spotify
    pkgs.starship
    pkgs.steam
    pkgs.xautolock
    pkgs.xclip
    pkgs.yadm
    pkgs.youtube-dl
  ];

  services.lorri.enable = true;

  programs.gpg.enable = true;

  programs = {
    git = {
      enable = true;
      userName = "${name}";
      userEmail = "${email}";
    };
  };
}
