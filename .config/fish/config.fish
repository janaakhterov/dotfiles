# Vi mode
fish_vi_key_bindings

# Clear greeting
set fish_greeting

# Environment Variables
set -gx EDITOR nvim

set -gx ANDROID_SDK $HOME/Android/Sdk

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.pub-cache/bin
fish_add_path $HOME/.yarn/bin
fish_add_path $HOME/.config/scripts
fish_add_path $HOME/go/bin
fish_add_path $HOME/ghq/github.com/flutter/flutter/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.dotnet/tools
fish_add_path $HOME/.node/bin
fish_add_path $HOME/.deno/bin
fish_add_path $HOME/.local/share/bin
fish_add_path $HOME/.krew/bin
fish_add_path $ANDROID_HOME/emulator
fish_add_path $ANDROID_HOME/tools
fish_add_path $ANDROID_HOME/tools/bin
fish_add_path $ANDROID_HOME/platform-tools

set -gx ANDROID_HOME $HOME/Android/Sdk

set -gx N_PREFIX "$HOME/.node"

set -gx LS_COLORS (vivid generate molokai)

set -gx HELIX_RUNTIME $HOME/repos/github.com/helix-editor/helix/runtime

if type -f rustc > /dev/null 2>&1
    set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src/
end

# nvim
abbr -a vim "nvim"

# ls
abbr -a ls "exa --header --git -la"

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

# Fish
abbr -a reload  "source $HOME/.config/fish/config.fish"

abbr -a gen-ed25519 "openssl genpkey -algorithm ed25519 -outform der | xxd -p -c 256"

abbr -a pf "nvim (fd --type f)"

abbr -a kbl "kubectl logs -f (kubectl get pods | tail -n +2 | sed \"s#^\(\S\+\)\s.*\\\$#\1#\" | fzf)"

# Jabba
[ -s "$HOME/.jabba/jabba.fish" ]; and source "$HOME/.jabba/jabba.fish"

starship init fish | source

# Volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

bash $HOME/.config/scripts/tmux.sh & disown

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

if type -q jabba
    jabba install openjdk@1.17.0
end

# Fixes gpg signing with git
set -gx GPG_TTY (tty)

# Fixes cargo git deps
set -gx CARGO_NET_GIT_FETCH_WITH_CLI true
