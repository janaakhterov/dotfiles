# Vi mode
fish_vi_key_bindings

# Clear greeting
set fish_greeting

# Environment Variables
set -gx EDITOR nvim

set -gx ANDROID_SDK $HOME/Android/Sdk

set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.pub-cache/bin $PATH
set -gx PATH $HOME/.yarn/bin $PATH
set -gx PATH $HOME/.config/scripts $PATH
set -gx PATH $HOME/go/bin $PATH
set -gx PATH $HOME/ghq/github.com/flutter/flutter/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.dotnet/tools $PATH
set -gx PATH $HOME/.node/bin $PATH
set -gx PATH $HOME/.deno/bin $PATH

set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/tools $PATH
set -gx PATH $ANDROID_HOME/tools/bin $PATH
set -gx PATH $ANDROID_HOME/platform-tools $PATH

set -gx N_PREFIX "$HOME/.node"

set -gx LS_COLORS (vivid generate molokai)

if type -f rustc > /dev/null 2>&1
    set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src/
end

# nvim
abbr -a vim "nvim"

# ls
abbr -a ls "exa"
abbr -a la "exa -a"
abbr -a ll "exa -l"

# Git
abbr -a gs   "git status"
abbr -a gp   "git pull"
abbr -a gpp  "git push"
abbr -a ga   "git add"
abbr -a gaa  "git add -A"
abbr -a gc   "git commit"
abbr -a gcm  "git commit -m"
abbr -a gcam "git commit -am"
abbr -a gd   "git diff"
abbr -a gds  "git diff --staged"
abbr -a gba  "git branch -a"
abbr -a gout "git checkout"
abbr -a gnew "git checkout -b"
abbr -a grh  "git reset --hard HEAD"
abbr -a grs  "git reset --soft HEAD"
abbr -a gf   "git fetch"
abbr -a gss  "git switch"

abbr pings "ping 8.8.8.8"

# Cargo
abbr -a cmt "cargo make test"
abbr -a cm  "cargo make"
abbr -a cc  "cargo check"

# Yadm
abbr -a ys   "yadm status"
abbr -a yp   "yadm pull"
abbr -a ypp  "yadm push"
abbr -a ya   "yadm add"
abbr -a yaa  "yadm add -A"
abbr -a yc   "yadm commit"
abbr -a ycm  "yadm commit -m"
abbr -a ycam "yadm commit -am"
abbr -a yd   "yadm diff"
abbr -a yds  "yadm diff --staged"
abbr -a yba  "yadm branch -a"

abbr -a npm "pnpm"

# Fish
abbr -a reload  "source $HOME/.config/fish/config.fish"

abbr -a pf "nvim (fd --type f)"

# Jabba
[ -s "/home/daniel/.jabba/jabba.fish" ]; and source "/home/daniel/.jabba/jabba.fish"

# navi widget fish | source

starship init fish | source
