{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    (pkgs.polybar.override { i3Support = true; pulseSupport = true; mpdSupport = true; })
    pkgs.alacritty
    pkgs.bat
    pkgs.exa
    pkgs.firefox
    pkgs.fish
    pkgs.fzf
    pkgs.ghq
    pkgs.git
    pkgs.go
    pkgs.hack-font
    pkgs.i3
    pkgs.nitrogen
    pkgs.polybar
    pkgs.rustup
    pkgs.vim
    pkgs.yadm
  ];

  programs.git = {
    enable = true;
    userName = "Daniel Akhterov";
    userEmail = "akhterovd@gmail.com";
  };

  xsession.enable = true;
  xsession.windowManager.command = "i3";
}
