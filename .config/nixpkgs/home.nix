{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.alacritty
    pkgs.exa
    pkgs.firefox
    pkgs.fish
    pkgs.fzf
    pkgs.ghq
    pkgs.go
    pkgs.hack-font
    pkgs.i3
    pkgs.nitrogen
    pkgs.polybar
    pkgs.rustup
    pkgs.yadm
    pkgs.bat
  ];

  programs.firefox.enable = true;

  programs.git = {
    enable = true;
    userName = "Daniel Akhterov";
    userEmail = "akhterovd@gmail.com";
  };

  xsession.enable = true;
  xsession.windowManager.command = "i3";
}
