{ config, pkgs, ... }:

let 
  name = "Daniel Akhterov";
  email = "akhterovd@gmail.com";
in
{
  home.packages = [
    (pkgs.polybar.override { i3Support = true; pulseSupport = true; mpdSupport = true; })
    pkgs.alacritty
    pkgs.alsaUtils
    pkgs.androidStudioPackages.canary
    pkgs.bat
    pkgs.binutils
    pkgs.cargo-edit
    /* pkgs.discord */
    pkgs.exa
    pkgs.feh
    pkgs.firefox
    pkgs.fish
    pkgs.fzf
    pkgs.gcc
    pkgs.ghq
    pkgs.gitAndTools.diff-so-fancy
    pkgs.go
    pkgs.hack-font
    pkgs.htop
    pkgs.i3
    pkgs.i3lock-fancy
    pkgs.jetbrains.idea-community
    pkgs.openjdk8
    pkgs.pulseaudio
    pkgs.rofi-unwrapped
    pkgs.rustup
    pkgs.shutter
    pkgs.steam
    pkgs.vim
    pkgs.xautolock
    pkgs.yadm
    pkgs.youtube-dl
  ];

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "${name}";
      userEmail = "${email}";
    };
  };
}
