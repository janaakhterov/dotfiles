{ config, pkgs, ... }:

let 
  name = "Daniel Akhterov";
  email = "akhterovd@gmail.com";
in
{
  home.packages = [
    (pkgs.polybar.override { i3Support = true; pulseSupport = true; mpdSupport = true; })
    pkgs.alacritty
    pkgs.bat
    /* pkgs.diff-so-fancy */
    pkgs.exa
    pkgs.feh
    pkgs.firefox
    pkgs.fish
    pkgs.fzf
    pkgs.ghq
    pkgs.go
    pkgs.hack-font
    pkgs.htop
    pkgs.i3
    pkgs.i3lock-fancy
    /* pkgs.idea-commmunity */
    /* pkgs.openjdk-8u212-ga */
    pkgs.rustup
    pkgs.vim
    pkgs.yadm
  ];

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "${name}";
      userEmail = "${email}";
    };
  };

  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
    };
  };
}
