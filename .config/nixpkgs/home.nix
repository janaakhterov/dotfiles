{ config, pkgs, ... }:

let 
  name = "Daniel Akhterov";
  email = "akhterovd@gmail.com";
in
{
  home.packages = [
    (pkgs.polybar.override { i3Support = true; pulseSupport = true; mpdSupport = true; })
    pkgs._1password
    pkgs.alacritty
    pkgs.alsaUtils
    pkgs.androidStudioPackages.canary
    pkgs.bat
    pkgs.binutils
    pkgs.cargo-edit
    pkgs.ctags
    pkgs.discord
    pkgs.dunst
    pkgs.exa
    pkgs.feh
    pkgs.firefox
    pkgs.fish
    pkgs.font-awesome
    pkgs.fuse
    pkgs.fzf
    pkgs.gcc
    pkgs.ghq
    pkgs.gitAndTools.diff-so-fancy
    pkgs.gitlab-runner
    pkgs.go
    pkgs.gnumake
    pkgs.hack-font
    pkgs.htop
    pkgs.i3
    pkgs.i3lock-fancy
    pkgs.jetbrains.idea-community
    pkgs.jq
    pkgs.libnotify
    pkgs.maven
    pkgs.mpv
    pkgs.neovim
    pkgs.ntfs3g
    pkgs.openjdk11
    pkgs.pulseaudio
    pkgs.python
    pkgs.python3
    pkgs.rofi-unwrapped
    pkgs.rustup
    pkgs.shutter
    pkgs.slack
    pkgs.spotify
    pkgs.steam
    pkgs.vim
    pkgs.xautolock
    pkgs.xclip
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
